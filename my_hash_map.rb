class MaxIntSet

    def initialize(max)
        @store = Array.new(max, false)
    end

    def insert(num)
        @store[num] = true
    end

    def remove(num)
        @store[num] = false
    end

    def include?(num)
        @store[num]
    end

end


class IntSet
    def initialize
        @store = Array.new(20) { Array.new }
    end

    def [](num)
        @store[num]
    end

    def insert(num)
        self[num % 20] << num
    end

    def remove(num)
        self[num % 20].delete(num) 
    end

    def include?(num)
        self[num % 20].include?(num)
    end
end

class ResizingIntSet
     def initialize
        @store = Array.new(5) { Array.new }
        @size = 0
    end

    def insert(n)
        @size += 1 
        resize if @size >= @store.length
        @store[n % @store.length] << n 
    end

    def remove(n)
        @size -= 1
        @store[n % @store.length].delete(n)
    end

    def include?(n)
        @store[n % @store.length].include?(n)
    end
    
   
    private

    def resize
        new_size = @store.length + 10
        new_store = Array.new(new_size) { Array.new }
        @store.each do |arr|
            arr.each do |ele|
                new_store[ele % new_size] << ele
            end
        end
        @store = new_store
    end
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

    # [1, 2, 3].hash == [1, 2, 3].hash # => true
    # [1, 2, 3].hash == [3, 2, 1].hash # => false

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