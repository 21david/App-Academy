def my_min(arr) # O(N^2)
    arr.each do |ele1|
        less = false
        arr.each do |ele2|
            if ele1 <= ele2
                less = true
            else
                less = false
                break
            end
        end
        return ele1 if less
    end
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5


def my_min_2(arr) # O(N)
    min = arr.first

    (1...arr.length).each do |i|
        min = arr[i] if arr[i] < min
    end

    min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min_2(list)  # =>  -5


def largest_contiguous_subsum(list)
    sub_arr = []

    list.each_with_index do |ele1, i1|
        list.each_with_index do |ele2, i2|
            sub_arr << 
        end
    end

end