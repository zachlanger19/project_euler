require 'prime'
require 'benchmark'

# n = 500000
# Benchmark.bm(7) do |x|
#   x.report("%           :") { n.times do   ; 420 % 4 == 0; end }
#   x.report("both methods:") { n.times do   ; 420.modulo(4).zero?; end }
#   x.report("zero method :") { n.times do   ; 420.%(4).zero?; end }
# end


start = Time.now

# result = 0
(5..12_000).each do |n|
  # result += x
end

finish = Time.now

p result
puts("#{finish - start} seconds")
