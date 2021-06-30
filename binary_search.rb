require 'byebug'
def bsearch(arr, target)
    if arr.length == 1
        if arr[0] == target
            return 0
        else
            return nil
        end
    end
    side = nil
    a = 0
    b = 0
    mid_position = arr.length / 2
    if arr[mid_position] == target
        return mid_position
    elsif arr[mid_position] < target
        a = bsearch(arr[mid_position+1..-1],target)
        side = true
    else
        b = bsearch(arr[0...mid_position],target) #b=0
        side = false
    end
    if a == nil || b == nil
        return nil
    end
    idx = 0
    if side
        idx += a + arr.length/2 + 1
    else
        idx = b
    end
    idx

end
p bsearch([1, 2, 3], 1) # =>0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil