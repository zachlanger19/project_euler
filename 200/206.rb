start = Time.now

x = Math.sqrt(1020304050607080900).to_i / 100 * 100 + 30

loop do
    if x % 100 == 30
        x += 40
    else
        x += 60
    end
    p x
    sqr = (x**2).to_s
    # reverse and see time improvement
    if sqr[14]=='8' && sqr[12]=='7' && sqr[10]=='6' && sqr[8]=='5' && sqr[6]=='4' && sqr[4]=='3' && sqr[2]=='2' && sqr[0]=='1'
        break
    end
end

puts "#{Time.now - start} sec"
