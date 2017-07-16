start = Time.now

increment = 2 * 3 * 5 * 7 * 11 * 13 * 17 * 19
n = increment
@divisors = (3..20).to_a.reverse

def divisible?(n)
  @divisors.each do |d|
    return false if n % d != 0
  end
  true
end

n += increment until divisible?(n)

puts n
puts "#{(Time.now - start) * 1000} milliseconds"