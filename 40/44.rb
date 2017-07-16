start = Time.now

def isPentagonal?(n)
    penTest = (Math.sqrt(1 + 24 * n) + 1.0) / 6.0
    return penTest == penTest.to_i;
end


i = 1
pentagonalNumbers = Hash.new
while true
   n = i * (3 * i - 1) / 2
   pentagonalNumbers[n] = 0
   j = i - 1
   while j > 0
      m = j * (3 * j - 1) / 2
      if pentagonalNumbers[n - m] == 0 && isPentagonal?(n + m)
         p n-m
         abort("#{(Time.now - start) * 1000} milliseconds")
      end
      j -= 1
    end
    i += 1
end

