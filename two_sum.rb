def bad_two_sum?(arr, target_sum)  # O(N^2)

    (0...arr.length-1).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum
        end
    end

    false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false


def okay_two_sum?(arr, target_sum) 
    sorted = arr.sort

    arr2 = [6, 5, 1, -1]
    sorted.each do |num|
        arr2 << target_sum - num
    end

    arr2.each do |num|
        result = sorted.bsearch { |x| x == num }
        return true if result
    end

    false
end

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false