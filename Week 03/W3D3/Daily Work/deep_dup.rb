def deep_dup(arr)
    if !arr.is_a?(Array)
        return arr
    end
    new_arr = []
    arr.each do |ele|
        new_arr << deep_dup(ele)
    end
    return new_arr
end
robot_parts = [1, [2], [3, [4]]]
p robot_parts.object_id
p robot_parts[2].object_id
p robot_parts2 = deep_dup(robot_parts) #=> a new array of ["nuts","bolts"] with new references
p robot_parts2.object_id
p robot_parts2[2].object_id