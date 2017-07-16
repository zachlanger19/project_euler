start = Time.now

@pyramid = [[75],
            [95, 64],
            [17, 47, 82],
            [18, 35, 87, 10],
            [20, 4, 82, 47, 65],
            [19, 1, 23, 75, 3, 34],
            [88, 2, 77, 73, 7, 63, 67],
            [99, 65, 4, 28, 06, 16, 70, 92],
            [41, 41, 26, 56, 83, 40, 80, 70, 33],
            [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
            [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
            [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
            [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
            [63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
            [4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23]]

@locations = [{'y' => 0, 'x' => 0, 'sum' => 75}]

def move()
  movedLocations = Array.new
  @locations.each do |h|
    newY = h['y'] + 1
    newX1 = h['x']
    newX2 = h['x'] + 1
    newSum1 = h['sum'] + @pyramid[newY][newX1]
    newSum2 = h['sum'] + @pyramid[newY][newX2]
    movedLocations.push({'y' => newY, 'x' => newX1, 'sum' => newSum1})
    movedLocations.push({'y' => newY, 'x' => newX2, 'sum' => newSum2})
  end
  @locations = movedLocations
end

def clean()
  index = 0
  while index < @locations.length - 1
    if @locations[index]['x'] == @locations[index + 1]['x']
      if @locations[index]['sum'] > @locations[index + 1]['sum']
        @locations.delete_at(index + 1)
      else
        @locations.delete_at(index)
      end
    end
    index += 1
  end
end

until @locations[0]['y'] == 14
  move
  clean
end

largest = 0
@locations.each do |h|
  if h['sum'] > largest
    largest = h['sum']
  end
end

p largest
puts "#{(Time.now - start) * 1000} milliseconds"