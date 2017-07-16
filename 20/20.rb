start = Time.now

p (1..100).inject(:*).to_s.split('').map { |s| s.to_i }.inject(:+)

puts "#{(Time.now - start) * 1000} milliseconds"