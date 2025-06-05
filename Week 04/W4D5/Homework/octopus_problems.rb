
def sluggish_octopus 
    arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
    max = -1
    i = 0
    while i < arr.length-1
        j = i + 1
        while j < arr.length
            if arr[i] > arr[j]
                max = arr[i] if arr[i] > max
            elsif arr[j] >= arr[i]
                max = arr[j] if arr[j] > max
            end
            j += 1
        end
        i += 1
    end

    max  
end
  
def dominant_octopus
    arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

    # sort in O(nlogn) time complexity
    sorted = merge_sort(arr)

    sorted[-1]
end
  
def merge_sort (array, &prc)
    return array if array.length <= 1

    mid_idx = array.length / 2
    merge(
        merge_sort(array.take(mid_idx), &prc),
        merge_sort(array.drop(mid_idx), &prc),
        &prc
    )
end
  
# NB: In Ruby, shift is an O(1) operation. This is not true of all languages.
def merge(left, right, &prc)
    merged_array = []
    prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
    until left.empty? || right.empty?
        case prc.call(left.first, right.first)
        when -1
            merged_array << left.shift
        when 0
            merged_array << left.shift
        when 1
            merged_array << right.shift
        end
    end

    merged_array + left + right
end
  
  
def clever_octopus
    arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
    max = arr[0]

    (1...arr.length).each do |i|
        max = arr[i] if arr[i] > max
    end

    max
end


# for constant dance!, 
# you would use a hash map that maps direction to index for O(1) access time
# this is because hash functions are being used in the background, which take a 
# constant number of steps to perform