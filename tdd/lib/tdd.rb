def my_uniq(arr)
    uniques = []
    arr.each do |element|
        if !uniques.include?(element)
            uniques << element
        end
    end
    uniques
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