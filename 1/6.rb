start = Time.now
sum_of_squares = 0
square_of_sums = 0

(1..100).each do |n|
  sum_of_squares += n**2
  square_of_sums += n
end
square_of_sums *= square_of_sums

puts square_of_sums - sum_of_squares
puts "#{(Time.now - start) * 1000} milliseconds"