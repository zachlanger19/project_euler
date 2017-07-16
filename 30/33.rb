start = Time.now

nums = 1
dens = 1
(11..99).each do |num|
	next if num.to_s.split('').include?('0')
	(num + 1..99).each do |den|
		next if den.to_s.split('').include?('0')
		result = num/den.to_f
		floNum = num.to_s.split('').map! { |s| s.to_f }
		floDen = den.to_s.split('').map! { |s| s.to_f }
		if floNum[0] == floDen[0] && floNum[1] / floDen[1] == result
			nums *= floNum[1]
			dens *= floDen[1]
		elsif floNum[0] == floDen[1] && floNum[1] / floDen[0] == result
			nums *= floNum[1]
			dens *= floDen[0]
		elsif floNum[1] == floDen[0] && floNum[0] / floDen[1] == result
			nums *= floNum[0]
			dens *= floDen[1]
		elsif floNum[1] == floDen[1] && floNum[0] / floDen[0] == result
			nums *= floNum[0]
			dens *= floDen[0]
		end
	end
end

p dens/nums
p "#{(Time.now - start) * 1000} milliseconds"