class Array

    def my_each(&prc)
        i = 0
        while count < (self.length) - 1
            prc.call(self[i])
            i += 1
        end
    end

end


return_value = [1, 2, 3].my_each do |num|
  puts num
end
.my_each do |num|
  puts num
end
# => 1
     2
     3
     1
     2
     3

p return_value  # => [1, 2, 3]