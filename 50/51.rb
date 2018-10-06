require 'prime'

def find(set_length)
  Prime.each(999_999) do |prime|
    next if prime < 100_000
    digits = prime.to_s.split('').map!(&:to_i)
    (0..9 - set_length + 1).each do |number_replaced|
      next if !digits.include?(number_replaced)
      prime_count = 0
      (0..9).each do |replacement|
        temp = digits.map { |n| n == number_replaced ? replacement : n }
        next if temp[0].zero?
        prime_count += 1 if temp.join.to_i.prime?
      end
      return prime if prime_count >= set_length
    end
  end
end
puts find(8)