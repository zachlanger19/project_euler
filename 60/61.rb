start = Time.now

tri = []
sqr = []
pent = []
hex = []
hept = []
oct = []
(1..400).each do |n|
	tri.push(n * (n + 1) / 2)
	sqr.push(n ** 2)
	pent.push(n * ((3 * n) - 1) / 2)
	hex.push(n * (2 * n - 1))
	hept.push(n * (5 * n - 3) / 2)
	oct.push(n * (3 * n - 2))
end

tri.reject! { |n| n < 1000 || n > 9999 }
sqr.reject! { |n| n < 1000 || n > 9999 }
pent.reject! { |n| n < 1000 || n > 9999 }
hex.reject! { |n| n < 1000 || n > 9999 }
hept.reject! { |n| n < 1000 || n > 9999 }
oct.reject! { |n| n < 1000 || n > 9999 }

@numbers = {"tri" => tri, "sqr" => sqr, "pent" => pent, "hex" => hex, "hept" => hept, "oct" => oct}

def findMatches(keys, value)
	matches = []
	keys.each do |key|
		@numbers[key].each do |possibleMatch|
			if value.to_s[2..3] == possibleMatch.to_s[0..1]
				matches.push({key => possibleMatch})
			end
		end
	end
	return matches
end

@numbers["oct"].each do |valueA|
	possibleKeysA = @numbers.keys
	possibleKeysA.delete("oct")
	matchesA = findMatches(possibleKeysA, valueA)
	next if matchesA.empty?

	matchesA.each do |hashB|
		keyB = hashB.keys[0]
		valueB = hashB.values[0]
		possibleKeysB = possibleKeysA.inject([]) { |a,element| a << element.dup }
		possibleKeysB.delete(keyB)
		matchesB = findMatches(possibleKeysB, valueB)	
		next if matchesB.empty?

		matchesB.each do |hashC|
			keyC = hashC.keys[0]
			valueC = hashC.values[0]
			possibleKeysC = possibleKeysB.inject([]) { |a,element| a << element.dup }
			possibleKeysC.delete(keyC)
			matchesC = findMatches(possibleKeysC, valueC)
			next if matchesC.empty?

			matchesC.each do |hashD|
				keyD = hashD.keys[0]
				valueD = hashD.values[0]
				possibleKeysD = possibleKeysC.inject([]) { |a,element| a << element.dup }
				possibleKeysD.delete(keyD)
				matchesD = findMatches(possibleKeysD, valueD)
				next if matchesD.empty?

				matchesD.each do |hashE|
					keyE = hashE.keys[0]
					valueE = hashE.values[0]
					possibleKeysE = possibleKeysD.inject([]) { |a,element| a << element.dup }
					possibleKeysE.delete(keyE)
					matchesE = findMatches(possibleKeysE, valueE)
					next if matchesE.empty?

					matchesE.each do |hashF|
						keyF = hashF.keys[0]
						valueF = hashF.values[0]
						next if valueF.to_s[2..3] != valueA.to_s[0..1]
						puts "#{valueA}, #{valueB}, #{valueC}, #{valueD}, #{valueE}, #{valueF}"
						puts [valueA, valueB, valueC, valueD, valueE, valueF].reduce(:+)
						puts "#{Time.now - start} seconds"
						exit
					end
				end
			end
		end
	end
end













