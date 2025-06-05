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

#  p second_anagram?("elvis", "lives")


def third_anagram?(string1, string2)    #worst = O(n^2) averege O(n log n)
    string1.chars.sort == string2.chars.sort
end

# p third_anagram?("elvis", "lives")

def fourth_anagram?(string1, string2)       #O(n)

    h1 = Hash.new(0)
    

    string1.each_char {|char| h1[char] += 1}
    string2.each_char {|char| h1[char] -= 1}

    !h1.any? { |k, v| v != 0 }
end 
 
p fourth_anagram?("elvis", "lives")