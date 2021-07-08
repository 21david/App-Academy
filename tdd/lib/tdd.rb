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