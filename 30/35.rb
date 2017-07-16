require 'prime'
start = Time.now

count = 0
Prime.each(1000000) do |n|
	digits = n.to_s.split('')
	cyclic = true
	digits.length.times do
		digits.rotate!(1)
		if !digits.join().to_i.prime?
			cyclic = false
			break
		end
	end
	if cyclic
		count += 1
	end
end

p count
p "#{(Time.now - start) * 1000} milliseconds"