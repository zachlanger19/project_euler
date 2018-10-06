require 'prime'
require 'time'

start = Time.now

def factors_of(number)
  primes, powers = number.prime_division.transpose
  exponents = powers.map{|i| (0..i).to_a}
  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end
  divisors.sort.map{|div| [div, number / div]}
end

def proper_divisors_of(number)
  factors_of(number).transpose[0][0..-2]
end

def next_in_chain(number)
  proper_divisors_of(number).inject(:+)
end

result = 0
longest_chain_length = 0

seen = {}

# 4.7 - 5
(2..1_000_000).each do |n|
  # p n
  next if seen.has_key?(n)

  chain = []

  while n != 1 && n < 1_000_000 && !seen.has_key?(n)
    chain << n
    seen[n] = true
    n = next_in_chain(n)
  end

  if chain.include?(n)
    chain_length = chain.length - chain.index(n)
    if chain_length > longest_chain_length
      longest_chain_length = chain_length
      result = n
    end
  end
end

puts
p result
p longest_chain_length
p Time.now - start