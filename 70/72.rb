require 'prime'
require 'time'
require 'benchmark'

# n = 500000
# Benchmark.bm(7) do |x|
#   x.report("1:") { n.times do   ; relative_primes1(1_000_000); end }
#   x.report("2:") { n.times do   ; relative_primes2(1_000_000); end }
# end

def relative_primes(n)
  Prime.prime_division(n).each do |prime, _|
    n = n * (prime - 1) / prime
  end
  n
end

start = Time.now

result = 0
(2..1_000_000).each do |n|
  result += relative_primes(n)
end

finish = Time.now

p result
puts("#{finish - start} seconds")
