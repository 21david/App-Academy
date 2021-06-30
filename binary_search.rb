def bsearch(arr, target)
    if arr.length == 1 && arr.include?(target)
        return true
    else
    mid_position = arr.length / 2
    if arr[mid_position] == target
        return mid_position
    elsif arr[mid_position] > target
        bsearch(arr[mid_position+1..-1])
    else
        bsearch(arr[0...mid_position])
    end

end