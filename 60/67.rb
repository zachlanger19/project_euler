start = Time.now

@pyramid = Array.new
File.open("files/67.txt").each do |line|
    row = line.chomp.to_s.split(' ').map! { |s| s.to_i }
    @pyramid.push(row)
end
# @pyramid = [[75],
# 		[95, 64],
# 		[17, 47, 82],
# 		[18, 35, 87, 10],
# 		[20, 4, 82, 47, 65],
# 		[19, 1, 23, 75, 3, 34],
# 		[88, 2, 77, 73, 7, 63, 67],
# 		[99, 65, 4, 28, 06, 16, 70, 92],
# 		[41, 41, 26, 56, 83, 40, 80, 70, 33],
# 		[41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
# 		[53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
# 		[70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
# 		[91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
# 		[63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
# 		[4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23]]

def climbDown(paths)
	newPaths = []
	paths.each do |path|
		row = path["row"] + 1
		indexA = path["index"]
		indexB = path["index"] + 1
		sumA = path["sum"] + @pyramid[row][indexA]
		sumB = path["sum"] + @pyramid[row][indexB]
		newPaths.push({ "row" => row, "index" => indexA, "sum" => sumA})
		newPaths.push({ "row" => row, "index" => indexB, "sum" => sumB})
	end
	return newPaths
end

def clean(paths)
	index = 0
	while index < paths.length - 1
		if paths[index]["index"] == paths[index + 1]["index"]
			if paths[index]["sum"] > paths[index + 1]["sum"]
				paths.delete_at(index + 1)
			else
				paths.delete_at(index)
			end
		end
		index += 1
	end
	return paths
end


paths = [{ "row" => 0, "index" => 0, "sum" => 59}]
while paths[0]["row"] < 14
	paths = climbDown(paths)
	paths = clean(paths)
end

max = 0
paths.each do |path|
	if path["sum"] > max
		max = path["sum"]
	end
end

p max
p "#{Time.now - start} seconds"