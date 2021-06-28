class Array

  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    new_arr = self.my_each {|num| num } 
    adjustable = true
    while adjustable == true
      adjustable = false

      new_arr.each_with_index do |ele, i|
        if !prc.call(ele)
          new_arr.delete_at(i)
          adjustable = true
        end 
      end
    end
    new_arr
  end

  def my_reject(&prc)
    new_arr = []
    self.each do |ele|
      new_arr << ele if !prc.call(ele)
    end
    new_arr
  end

  def my_any?(&prc)
    self.each { |ele| return true if prc.call(ele) }
    false
  end

  def my_all?(&prc)
    self.each { |ele| return false if !prc.call(ele) }
    true
  end

  def my_flatten
    return [self] if !self.kind_of?(Array)

    new_arr = []
    self.each do |element|
      if element.kind_of?(Array)
        element.my_flatten
      else
        new_arr << element
      end
    end
  end

end


# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
# #      2
# #      3
# #      1
# #      2
# #      3

# p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]