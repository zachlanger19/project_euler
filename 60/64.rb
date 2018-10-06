require 'time'
require 'benchmark'

# n = 5000000
# Benchmark.bm(7) do |x|
#   x.report("1:") { n.times do   ; 1.5 / 1; end }
#   x.report("2:") { n.times do   ; 1.5.floor; end }
# end


# fraction_part = Math.sqrt(23)
# puts("fract: #{fraction_part}")
#
# whole_part = fraction_part.floor
# p whole_part
#
# fraction_part = 1 / (fraction_part - whole_part)
# whole_part = fraction_part.floor
# p whole_part

# fraction_part = fraction_part - whole_part
# fraction_part = 1 / fraction_part
# whole_part = fraction_part.floor
# p whole_part

def continued_fraction(n)
    seen_fractions = []
    values = []

    n -= n.floor

    while !seen_fractions.include?(n)
        seen_fractions << n
        n = 1 / n
        values << n.floor
        p n.floor
        n -= n.floor
    end
    return seen_fractions
end

p continued_fraction(Math.sqrt(23))

# start = Time.now
#
# result = 0
# (2..13).each do |n|
#     next if Math.sqrt(n) == Math.sqrt(n).floor
#     continued_fraction(Math.sqrt(n))
# end
#
# finish = Time.now

# p result
# puts("#{finish - start} seconds")
