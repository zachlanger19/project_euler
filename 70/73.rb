require 'prime'
require 'time'
require 'benchmark'

# n = 500000
# Benchmark.bm(7) do |x|
#   x.report("%           :") { n.times do   ; 420 % 4 == 0; end }
#   x.report("both methods:") { n.times do   ; 420.modulo(4).zero?; end }
#   x.report("zero method :") { n.times do   ; 420.%(4).zero?; end }
# end

def fractions_between_third_and_half(n)
  factors = Prime.prime_division(n).transpose[0]
  x = (n / 3.0).ceil.to_f
  count = 0
  while (x / n < 0.5)
    count += 1 if !factors.map{|p| x % p == 0}.any?
    x += 1
  end
  count
end

# p fractions_between_third_and_half(5)

start = Time.now

result = 0
(5..12_000).each do |n|
  result += fractions_between_third_and_half(n)
end

finish = Time.now

p result
puts("#{finish - start} seconds")
