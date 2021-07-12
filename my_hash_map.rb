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
        @array = Array.new(20) { Array.new }
    end

    def [](num)
        @array[num]
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