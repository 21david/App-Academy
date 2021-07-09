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


def largest_contiguous_subsum(list)     #O(n^3)
    sub_arr = []

    list.each_index do |i1|     # O(n^3)
        (i1...list.length).each do |i2|
            sub_arr << list[i1..i2]
        end
    end

    max = sub_arr.first.sum  
    (1...sub_arr.length).each do |i|    # O(n^2)
        max = sub_arr[i].sum if sub_arr[i].sum > max
    end

    max

end

list = [2, 3, -6, 7, -6, 7]

p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])


def largest_contiguous_subsum_2(list)
    largest = list.first
    current_sum = list.first

    (1...list.length).each do |i|
        if current_sum + list[i] > list[i]
            largest = current_sum + list[i] 
            current_sum += list[i]
        else
            largest = list[i]
    end

end