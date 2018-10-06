start = Time.now

def rectangles(width, height)
	count = 0
	(1..width).each do |subWidth|
		(1..height).each do |subHeight|
			count += (width - (subWidth - 1)) * (height - (subHeight - 1))
		end
	end
	return count
end

min = 10000
minArea = 0
w = 0
h = 2000

until h == 0
	rects = 0
	until rects > 2000000
		w += 1
		rects = rectangles(w, h)
	end

	if rects - 2000000 < min
		min = rects - 2000000
		minArea = w * h
		puts "#{h} X #{w}"
	end
	rects = rectangles(w - 1, h)
	if 2000000 - rects < min
		min = 2000000 - rects
		minArea = (w - 1) * h
		puts "#{h} X #{w - 1}"
	end

	h -= 1
	w = 0
end
puts min
puts minArea
puts "#{Time.now - start} seconds"