class Solve
    def initialize(grid)
        @grid = grid
    end

    def possible_values(cell, square)
        values = (1..9).to_a
                    
        # delete values in same grid
        @grid[cell].each do |delete_value|
            values.delete(delete_value)
        end
                    
        # delete values in same row
        if [0,1,2].include?(cell)
            cell_values = [0,1,2]
        elsif [3,4,5].include?(cell)
            cell_values = [3,4,5]
        elsif [6,7,8].include?(cell)
            cell_values = [6,7,8]
        end
                    
        if [0,1,2].include?(square)
            square_values = [0,1,2]
        elsif [3,4,5].include?(square)
            square_values = [3,4,5]
        elsif [6,7,8].include?(square)
            square_values = [6,7,8]
        end
                    
        cell_values.each do |delete_cell|
            square_values.each do |delete_square|
                values.delete(@grid[delete_cell][delete_square])
            end
        end
                    
        # delete values in same coloumn
        if [0,3,6].include?(cell)
            cell_values = [0,3,6]
        elsif [1,4,7].include?(cell)
            cell_values = [1,4,7]
        elsif [2,5,8].include?(cell)
            cell_values = [2,5,8]
        end
                    
        if [0,3,6].include?(square)
            square_values = [0,3,6]
        elsif [1,4,7].include?(square)
            square_values = [1,4,7]
        elsif [2,5,8].include?(square)
            square_values = [2,5,8]
        end
                    
        cell_values.each do |delete_cell|
            square_values.each do |delete_square|
                values.delete(@grid[delete_cell][delete_square])
            end
        end

        return values
    end
    
    def fill_in
        cell = 0
        square = 0
        9.times do
            9.times do
                if @grid[cell][square] == nil
                    if possible_values(cell, square).length == 1
                        @grid[cell][square] = possible_values(cell, square)[0]
                    end
                end
                square += 1
            end
            cell += 1
            square = 0
        end
    end

    def solved?
    	grid_is_solved = true
        @grid.each do |cell|
        	if cell.include?(nil)
                grid_is_solved = false
            end
        end
        if grid_is_solved
            puts "#{@grid[0][0..2].join}"
        end
        return grid_is_solved
    end

    def stuck?
    	@prior_grid == @grid ? true : false
    end

    def broken?
    	cell = 0
        square = 0
        9.times do
            9.times do
                if @grid[cell][square] == nil
                    if possible_values(cell, square).length == 0
                        return true
                    end
                end
                square += 1
            end
            cell += 1
            square = 0
        end
        return false
    end

    def solve
        until solved? || stuck?
            @prior_grid = @grid.inject([]) { |a,element| a << element.dup }
            fill_in
        end
        if !broken?
            cell = 0
            square = 0
            9.times do
                9.times do 
                    if @grid[cell][square] == nil
                        backup_grid =  @grid.inject([]) { |a,element| a << element.dup }

                        possible_values(cell, square).each do |test_value|
                            @grid[cell][square] = test_value
                            solve
                            @grid = backup_grid.inject([]) { |a,element| a << element.dup }
                        end
                        return
                    end
                    square += 1
                end
                cell += 1
                square = 0
            end
        end
    end
end






