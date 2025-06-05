def reverse(str)
    return "" if str.length == 0
    str[-1] + reverse(str[0...-1])
end

# Another solution
def reverse2(str)
    return "" if str.length == 0
    reverse(str[1..-1]) + str[0]
end

# Test Cases
p  reverse("house") # => "esuoh"
p  reverse("dog") # => "god"
p  reverse("atom") # => "mota"
p  reverse("q") # => "q"
p  reverse("id") # => "di"
p  reverse("") # => ""