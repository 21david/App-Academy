def my_uniq(arr)
    uniques = []
    arr.each do |element|
        if !uniques.include?(element)
            uniques << element
        end
    end
    uniques
end

class Array

    def two_sum
        new_arr= []

        self.each_with_index do |ele, idx|
            self.each_with_index do |ele2, idx2|
                if ele + ele2 == 0 && idx < idx2
                    new_arr << [idx, idx2]
                end
            end
        end
        new_arr
    end

end

def my_transpose(matrix)

    matrix.map.with_index do |row, i|
        arr = []
        matrix.each do |cur_row|
            arr << cur_row[i]
        end
        arr
    end

end


def stock_picker(arr)
    max = 0
    low_and_high_days = nil
    arr.each_with_index do |day1, idx1|
        arr.each_with_index do |day2, idx2|
            if day2 - day1 > max && idx1 < idx2
                max = day2 - day1
                low_and_high_days = [idx1, idx2]
            end
        end
    end

    low_and_high_days
end


class TowersOfHanoi
    attr_reader :pegs

    def initialize
        @pegs = [ [3, 2, 1], [], [] ]
    end

    def move
        while !TowersOfHanoi.won?(pegs)
            puts "Enter peg number to take from"
            input = gets.chomp.to_i
            puts "Enter peg number to add to"
            input_2 = gets.chomp.to_i
            raise "Please try again" if pegs[input].empty?
        end
    end

    def self.won?(array)
        array == [ [], [3, 2, 1], [] ] || array == [ [], [], [3, 2, 1]]
    end

end