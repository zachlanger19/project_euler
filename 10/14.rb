start = Time.now

knownSequences = {1 => 1}
largestValue = 0
largestKey = 1

(1..999999).each do |n|
  seenNumbers = [n]
  until knownSequences.include?(n)
    if n % 2 == 0
      n /= 2
    else
      n = 3 * n + 1
    end
    seenNumbers.push(n)
  end
  addedLength = knownSequences[seenNumbers[-1]]
  seenNumbers.pop
  seenNumbers.reverse.each_with_index do |x, i|
    len = i + 1 + addedLength
    knownSequences[x] = len
    if len > largestValue
      largestValue = len
      largestKey = x
    end
  end
end

p largestKey
puts "#{(Time.now - start) * 1000} milliseconds"