def merge_sort(arr) #([38,27,43])
    if arr.length == 1 || arr.length == 0
        return arr
    end

    mid_pos = arr.length/2
    left = merge_sort(arr[0..mid_pos])
    right = merge_sort(arr[mid_pos+1..-1])
    merge(left,right) #output some sorted array
end

def merge(arr1,arr2)
    new_arr = []
    a1 = 0
    a2 = 0
    while a1 < arr1.length && a2 < arr2.length
        min = arr1[a1]
        if arr2[a2] < min
            new_arr << arr2[a2]
            a2 += 1
        else
            new_arr << min
            a1 += 1
        end
    end
    while a1 < arr1.length 
        new_arr << arr1[a1]
        a1 += 1
    end
    while a2 < arr2.length 
        new_arr << arr2[a2]
        a2 += 1
    end
    new_arr
end

p merge_sort([38,27,43,3,9,82,10])