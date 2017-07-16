start = Time.now

numbers = '731671765313306249192251196744265747423553491949349698352031277450632
62395783180169848018694788518438586156078911294949545950173795833195285320880551
11254069874715852386305071569329096329522744304355766896648950445244523161731856
40309871112172238311362229893423380308135336276614282806444486645238749303589072
96290491560440772390713810515859307960866701724271218839987979087922749219016997
20888093776657273330010533678812202354218097512545405947522435258490771167055601
36048395864467063244157221553975369781797784617406495514929086256932197846862248
28397224137565705605749026140797296865241453510047482166370484403199890008895243
45065854122758866688116427171479924442928230863465674813919123162824586178664583
59124566529476545682848912883142607690042242190226710556263211111093705442175069
41658960408071984038509624554443629812309878799272442849091888458015616609791913
38754992005240636899125607176060588611646710940507754100225698315520005593572972
571636269561882670428252483600823257530420752963450'.split('').map!(&:to_i)
largest = 0

(0..numbers.length - 13).each do |i|
  next if numbers[i..i + 12].include?(0)
  product = numbers[i..i + 12].inject(:*)
  largest = product if product > largest
end

puts largest
puts "#{(Time.now - start) * 1000} milliseconds"