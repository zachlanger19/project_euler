start = Time.now

p (2**1000).to_s.split('').map { |s| s.to_i }.inject(:+)
puts "#{(Time.now - start) * 1000} milliseconds"