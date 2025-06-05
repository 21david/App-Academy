def exp1(base, pow)
    return 1 if pow == 0
    base * exp1(base, pow - 1)
end

# p exp1(2, 5)


def exp2(base, pow)
    return 1 if pow == 0
    return base if pow == 1
    if pow.even?
        a = exp2(base, pow / 2) 
        a * a
    else
        b = exp2(base, (pow - 1) / 2)
        base * (b * b)
    end
end

p exp2(2, 5)
p exp2(2, 6)
