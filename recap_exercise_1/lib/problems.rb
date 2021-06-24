# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    # go through every pair, check if they have all vowels, and add to a list if they do
    list = []
    i = 0
    while i < words.length - 1
        j = i + 1
        while j < words.length
            list << words[i] + ' ' + words[j] if all_vowels(words[i], words[j])
            j += 1
        end
        i += 1
    end
    list
end

def all_vowels(word1, word2)
    vowels_arr = Array.new(5, false)
    vowels = "aeiou"

    # check word1 chars
    word1.each_char do |c|
        if vowels.include?(c)
            vowels.sub!(c, '') # remove current vowel from vowels
        end
    end

    # check word2 chars
    word2.each_char do |c|
        if vowels.include?(c)
            vowels.sub!(c, '') # remove current vowel from vowels
        end
    end

    # if and only if vowels is now an empty string, then the words had all 5 vowels
    vowels.length == 0
end

p all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each do |fac|
        return true if num % fac == 0
    end
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    # for each bigram, we will search for it in the string, and put it in an array if it was found
    found = []
    bigrams.each do |bg|
        found << bg if str.include?(bg)
    end
    found
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new { |k, v| k == v }

        # create a new hash to store key-value pairs that pass the proc
        # iterate through current key-value pairs, and only add to the new hash the ones that pass the proc
        new_hash = {}
        self.each do |k, v|
            new_hash[k] = v if prc.call(k, v)
        end

        new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        substrings = []
        if length
            # return all subtrings of length 'length'
            i = 0
            while i <= self.length - length
                substrings << self[i...i+length]
                i += 1 
            end
        else
            # return all substrings
            i = 0
            while i < self.length
                j = i + 1
                while j <= self.length
                    substrings << self[i...j]
                    j += 1
                end
                i += 1
            end
        end
        substrings
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = ('a'..'z').to_a

        new_str = ""

        self.each_char do |c|
            ind = alphabet.index(c)
            new_ind = (ind + num) % 26
            new_char = alphabet[new_ind]
            new_str += new_char
        end

        new_str
    end
end

# p "supercalifrag".substrings(3)
# p "supercalifrag".substrings(12)
# p "supercalifrag".substrings(13)
# p "supercalifrag".substrings
