def first_anagram?(string1, string2)
    anagrams = [] 

    anagrams = string1.chars.permutation(string1.length).to_a
    anagrams.include?(string2.chars)

end

# p first_anagram?("elvis", "lives")


