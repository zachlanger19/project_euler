require 'prime'
start = Time.now

n = 1
step = 2
diagonalValues = 1
primes = 0
until primes != 0 && primes/diagonalValues.to_f < 0.1
	4.times do
		n += step
#		p n
		diagonalValues += 1
		primes += 1 if n.prime?
	end
	step += 2
end


p "width: #{step - 1}"
p "diagonals: #{diagonalValues}"
p "primes: #{primes}"
p "#{Time.now - start} seconds"