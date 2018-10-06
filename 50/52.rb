start = Time.now

(1..100000000).each do |n|
	next if n.to_s.split('').sort != (2 * n).to_s.split('').sort
	next if n.to_s.split('').sort != (3 * n).to_s.split('').sort
	next if n.to_s.split('').sort != (4 * n).to_s.split('').sort
	next if n.to_s.split('').sort != (5 * n).to_s.split('').sort
	next if n.to_s.split('').sort != (6 * n).to_s.split('').sort
	p "#{n} made it to x6"
	p "#{Time.now - start} seconds"
	exit
end