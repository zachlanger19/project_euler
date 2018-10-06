start = Time.now

$matrix = []
File.open("../files/83.txt").each do |line|
    row = line.chomp.to_s.split(',').map! { |s| s.to_i }
    $matrix.push(row)
end
$width = 80
$height = 80

# $matrix =
#[[131,673,234,103,18],
# [201,96,342,965,150],
# [630,803,746,422,111],
# [537,699,497,121,956],
# [805,732,524,37,331]]
# $width = 5
# $height = 5

$best_found_vals = Array.new($height){Array.new($width, 2_147_483_647)}

class Point
	def initialize(row, col, val)
		@row = row
        @col = col
        @val = val
	end

	def row
		@row
	end

    def col
        @col
    end

    def val
        @val
    end

    def move
        new_points = []
        # move left
        if @col > 0
            row = @row
            col = @col - 1
            val = @val + $matrix[row][col]
            if $best_found_vals[row][col] > val
                $best_found_vals[row][col] = val
                new_points << Point.new(row, col, val)
            end
        end

        # move up
        if @row > 0
            row = @row - 1
            col = @col
            val = @val + $matrix[row][col]
            if $best_found_vals[row][col] > val
                $best_found_vals[row][col] = val
                new_points << Point.new(row, col, val)
            end
        end

        # move right
        if @col < $width - 1
            row = @row
            col = @col + 1
            val = @val + $matrix[row][col]
            if $best_found_vals[row][col] > val
                $best_found_vals[row][col] = val
                new_points << Point.new(row, col, val)
            end
        end

        # move down
        if @row < $height - 1
            row = @row + 1
            col = @col
            val = @val + $matrix[row][col]
            if $best_found_vals[row][col] > val
                $best_found_vals[row][col] = val
                new_points << Point.new(row, col, val)
            end
        end

        return new_points
    end
end

active_points = [Point.new(0, 0, $matrix[0][0])]
$best_found_vals[0][0] = $matrix[0][0]

while active_points.length > 0
    new_points = []
    active_points.each do |p|
        new_points += p.move
    end
    active_points = new_points
end

p $best_found_vals[$height-1][$width-1]

puts "#{Time.now - start} seconds"
