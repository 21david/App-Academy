class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
        arr = []
        self.each_with_index do |el, i|
            if el.is_a?(String)
                arr << el.hash
            else
                arr << el * i 
            end
        end
        total = arr.sum 
        total.hash
    end
end

class String
   def hash 
        arr = []
        self.each_char.with_index do |char, i|
            arr << char.ord * i 
        end
        total = arr.sum
        total.hash
    end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr1 = self.select { |key, value| key.is_a?(Integer) }
      arr2 = self.select { |key, value| key.is_a?(String) }
      sorted1 = arr1.sort 
      sorted2 = arr2.sort
      combined = sorted1 + sorted2
      total = 0
      combined.each do |sub|
          sum = 0
          sub.each_with_index do |ele, i|
              if ele.is_a?(Integer)
                  sum += ele * i
              else
                  sum += ele.hash * i
              end
          end
          total += sum
      end
      total.hash
  end
end
