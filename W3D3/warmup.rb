#hello

def range(start, end1)
    return [] if end1 < start
    return [end1 - 1] if end1 - start == 1
    range(start, end1 - 1) + [end1 - 1]
end

def sum_of_arr_rec(arr)
    return nil if arr.length == 0
    return arr[0] if arr.length == 1
    arr.first + sum_of_arr_rec(arr[1..-1])
end


p sum_of_arr_rec([-10, 3, 4])