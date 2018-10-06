def rank(deal)
    lhand = deal.split(' ')[0..4].map { |card| card.split('') }
    rhand = deal.split(' ')[5..9].map { |card| card.split('') }

    lvalues = lhand.transpose[0]
    lsuits = lhand.transpose[1]
    rvalues = rhand.transpose[0]
    rsuits = rhand.transpose[1]

    values = '23456789TJQKA'
    suits = 'SHCD'

    p lvalues
    p lsuits
    p rvalues
    p rsuits

    if lvalues.map { |v| order.index(v) }.sort.each_cons(2).all? { |x,y| y == x + 1 } && lvalues.map { |v| order.index(v) }.sort.each_cons(2).all? { |x,y| y == x + 1 }

    end

    return 0
end

rank('8C TS KC 9H 4S 7D 2S 5D 3S AC')

# count = 0
# File.open('../files/54.txt').each do |line|
#     p line
#     count += rank(line) == 1 ? 1 : 0
# end
# p count
