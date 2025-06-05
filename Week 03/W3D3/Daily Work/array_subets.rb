

def subsets(arr)
    new_arr = []

    arr.each do |ele|
        arr1= []
        arr2= []
        arr1 << ele
        arr1 << subsets(arr1[1..-1])
        arr2 << subsets(arr2[1..-1])
        new_arr << arr1
        new_arr << arr2
    end

    new_arr
end