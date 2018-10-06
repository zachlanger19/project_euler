start = Time.now

best = 0
(900000..1000000).each do |denom|
	num = ((denom.to_f / 7) * 3).floor
	if num/denom.to_f < 3/7.to_f && num/denom.to_f > best
		best = num/denom.to_f
		puts "#{num}/#{denom}"
	end
end

puts "#{Time.now-start} seconds"