start = Time.now

p [0,1,2,3,4,5,6,7,8,9].permutation.first(1000000).last.join

puts "#{(Time.now - start) * 1000} milliseconds"