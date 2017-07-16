start = Time.now
require 'prime'

increment = 1
triangleNumber = increment

def enoughDivisors(n)
  sum = 1
  n.prime_division.each { |arr| sum *= arr[1] + 1 }
  if sum >= 500
    return true
  else
    return false
  end
end

until enoughDivisors(triangleNumber)
  increment += 1
  triangleNumber += increment
end

puts triangleNumber
puts "#{(Time.now - start) * 1000} milliseconds"