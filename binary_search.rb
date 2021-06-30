def bsearch(arr, target)
    if arr.length == 1 && arr.include?(target)
        return true
    end
    side = nil

    mid_position = arr.length / 2
    if arr[mid_position] == target
        return mid_position
    elsif arr[mid_position] < target
        a = bsearch(arr[mid_position+1..-1],target)
        side = true
    else
        b = bsearch(arr[0...mid_position],target) #([1],1) b= true after being recursively called
        side = false
    end
    idx = 0
    if side
        idx += arr.length/2
    end
    idx
end
p bsearch([1, 2, 3], 1) # =>0
p bsearch([2, 3, 4, 5], 3) # => 1