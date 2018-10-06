start = Time.now

class Point
	def initialize(x = 0, y = 0)
		@x = x
		@y = y
	end

	def x
		return @x
	end

	def y
		return @y
	end
end

def sign(p1, p2, p3)
    return (p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y)
end

def PointInTriangle(pt, v1, v2, v3)
    b1 = sign(pt, v1, v2) < 0
    b2 = sign(pt, v2, v3) < 0
    b3 = sign(pt, v3, v1) < 0

    return ((b1 == b2) && (b2 == b3))
end

count = 0
File.open("files/triangles.txt").each do |line|
	x = line[0..line.index(',')-1].to_i
	line[0..line.index(',')] = ''
	y = line[0..line.index(',')-1].to_i
	line[0..line.index(',')] = ''
	v1 = Point.new(x, y)

	x = line[0..line.index(',')-1].to_i
	line[0..line.index(',')] = ''
	y = line[0..line.index(',')-1].to_i
	line[0..line.index(',')] = ''
	v2 = Point.new(x, y)

	x = line[0..line.index(',')-1].to_i
	line[0..line.index(',')] = ''
	y = line.to_i
	v3 = Point.new(x, y)



	count += 1 if PointInTriangle(Point.new(0, 0), v1, v2, v3)
end

p count
p "#{(Time.now - start) * 1000} ms"