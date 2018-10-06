require 'set'

start = Time.now

stones = 1
groups = Set.new
groups << [1]

groupSizes = [1]
puts "#{stones} stones: #{groups.size} groups"
while stones < 30
    newGroups = Set.new
    groups.each do |piles|
        newGroups << (piles + [1]).sort
        piles.uniq.each do |pile|
            newPile = Marshal.load(Marshal.dump(piles))
            newPile[piles.index(pile)] += 1
            newGroups << newPile.sort
        end
    end
    groups = newGroups
    stones += 1

    puts "#{stones} stones: #{groups.size} groups"
    groupSizes << groups.size
end
# p groups
# p stones
p groupSizes

puts "#{Time.now - start} sec"
