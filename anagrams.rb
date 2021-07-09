def first_anagram?(string1, string2) # O(N!)
    anagrams = [] 

    anagrams = string1.chars.permutation(string1.length).to_a
    anagrams.include?(string2.chars)

end

# p first_anagram?("elvis", "lives")


def second_anagram?(string1, string2) # O(N^2)

    arr = string2.chars

    string1.each_char do |char|
        index = arr.find_index(char)
        if index == nil
            return false
        else
            arr.delete_at(index)
        end
    end

    arr.empty?
end

 p second_anagram?("elvis", "lives")