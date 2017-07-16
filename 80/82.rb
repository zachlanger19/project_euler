start = Time.now

# @matrix = Array.new
# File.open("files/82.txt").each do |line|
#     row = line.chomp.to_s.split(',').map! { |s| s.to_i }
#     @matrix.push(row)
# end

@matrix = [[131, 673, 234, 103, 18],
				[201, 96, 342, 965, 150],
				[630, 803, 746, 422, 111],
				[537, 699, 497, 121, 956],
				[805, 732, 524, 37, 331]]

paths = Array.new
@matrix.each_with_index do |row, y|
	paths.push({'x' => 0, 'y' => y, 'value' => row[0]})
end

def moveUp(paths)
	newPaths = Array.new
	paths[1..-1].each_with_index do |path, i|
		newValue = path['value'] + @matrix[i - 1][path['x']]
		p "#{newValue} vs #{paths[i - 1]['value']}"
		if newValue < paths[i - 1]['value']
			newPaths.push({'x' => path['x'], 'y' => i - 1, 'value' => newValue})
		else
			newPaths.push(paths[i - 1])
		end
	end
	newPaths.push(paths[-1])
	return newPaths
end

def moveDown(paths)
	newPaths = Array.new
	newPaths.push(paths[0])
	paths[1..-1].each_with_index do |path, i|
		newValue = paths[i - 1]['value'] + @matrix[path['y']][path['x']]
		if newValue < path['value']
			newPaths.push({'x' => path['x'], 'y' => path['y'], 'value' => newValue})
		else
			newPaths.push(path)
		end
	end
	return newPaths
end

paths = moveUp(paths)
paths.each do |path|
	p path
end
p "#{(Time.now - start) * 1000} ms"