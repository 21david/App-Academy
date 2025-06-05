def bad_two_sum?(arr, target_sum)  # O(N^2)

    (0...arr.length-1).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum
        end
    end

    false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


def okay_two_sum?(arr, target_sum) # worst case O(N^2), average case O(n log n)
    sorted = arr.sort

    arr2 = []
    sorted.each do |num|
        arr2 << target_sum - num
    end

    arr2.each_with_index do |num, i| # O(n log n)
        result = sorted.bsearch { |x| x == num }
        if sorted.index(num) == i
            next
        end
        return true if result
    end

    false
end

# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false


def two_sum?(arr, target_sum)  # O(N)
    hash = Hash.new(0)
    count = Hash.new(0)

    arr.each do |num|
        hash[num] = target_sum - num
        count[num] += 1
    end

    hash.each do |key, value|
        if hash.has_key?(value) 
            if key == value 
                if count[value] > 1
                    return true
                end
            else
                return true
            end
        end
    end

    false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false