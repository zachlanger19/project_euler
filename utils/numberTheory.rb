def gcd(a, b)
    loop do
        a,b = b, a % b
        return a if b == 0
    end
end

def lcm(a, b)
    return (a * b / gcd(a, b))
end
