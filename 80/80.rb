require 'bigdecimal'
require 'time'



def sum_sqrt_digits(n)
  sqrt = Math.sqrt(BigDecimal.new(n))
  return 0 if sqrt == sqrt.floor
  10.times do
    sqrt %= 1
    sqrt *= 10**10
    puts(sqrt)
  end

end

sum_sqrt_digits(2)

start = Time.now

result = 0
(2..99).each do |n|

end

finish = Time.now

p result
puts("#{finish - start} seconds")
