start = Time.now

count = 0
(1..100).each do |base|
  (1..100).each do |power|
    digitlength = (base ** power).to_s.length
    count += 1 if digitlength == power
    next if power > digitlength
  end
end
puts count
puts "#{Time.now - start} seconds"