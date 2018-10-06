baseExp = []
File.open('files/99.txt').each do |line|
	baseExp.push(line.chomp.split(','))
end

largest = 0
largestIndex = 0
baseExp.each_with_index do |set, i|
	value = Math.log(set[1].to_i) + Math.log(Math.log(set[0].to_i))
	if value > largest
		largest = value
		largestIndex = i
	end
end

puts largestIndex + 1