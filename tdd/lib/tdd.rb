def my_uniq(arr)
    uniques = []
    arr.each do |element|
        if !uniques.include?(element)
            uniques << element
        end
    end
    uniques
end