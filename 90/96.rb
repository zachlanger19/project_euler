require_relative 'files/sudoku.rb'

lineNum = 1
sum = 0
input = Array.new
File.open("files/96.txt").each do |line|
	if lineNum % 10 != 1
   	row = line.chomp.split('')
   	row.map! { |s| s.to_i }
   	row.map! { |n| n == 0 ? n = nil : n }
   	input.push(row)
   end
   if lineNum % 10 == 0
   	output = [input[0][0..2] + input[1][0..2] + input[2][0..2],
   	input[0][3..5] + input[1][3..5] + input[2][3..5],
   	input[0][6..8] + input[1][6..8] + input[2][6..8],
   	input[3][0..2] + input[4][0..2] + input[5][0..2],
   	input[3][3..5] + input[4][3..5] + input[5][3..5],
   	input[3][6..8] + input[4][6..8] + input[5][6..8],
   	input[6][0..2] + input[7][0..2] + input[8][0..2],
   	input[6][3..5] + input[7][3..5] + input[8][3..5],
   	input[6][6..8] + input[7][6..8] + input[8][6..8]
   	]
   	s = Solve.new(output)
   	s.solve
   	input = Array.new
   end
   lineNum += 1
end

puts sum