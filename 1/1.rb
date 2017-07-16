start = Time.now

sum = 0
(1..999).each do |n|
  if (n % 3).zero?
    sum += n
  elsif (n % 5).zero?
    sum += n
  end
end

puts sum
puts "#{(Time.now - start) * 1000} milliseconds"