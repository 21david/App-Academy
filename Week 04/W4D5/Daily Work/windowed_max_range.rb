
def windowed_max_range(arr, w)
    current_max_range = nil

    (0..arr.length-w).each do |i|
        min = arr[i...i+w].min
        max = arr[i...i+w].max
        diff = max - min
        if current_max_range.nil?
            current_max_range = diff
        elsif diff > current_max_range
            current_max_range = diff
        end
    end

    current_max_range

end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


class Queue

    def intialize 
        @store = []
    end

    def enqueue(val)
        @store << val
    end

    def dequeue
        @store.shift
    end

    def peek 
        @store.first
    end

    def empty?
        @store.empty?
    end 

    def size
        @store.length
    end

end


def MyStack

    def intialize
        @stack = []
    end

    def pop
        @stack.pop
    end

    def push(val)
        @stack << val
    end

    def peek
        @stack.last
    end

    def size
        @stack.length
    end

    def empty?
        @stack.empty?
    end

end

class StackQueue

    def initialize
        @front = MyStack.new
        @back = MyStack.new
    end

    def enqueue
        
    end

    def dequeue

    end

    def size

    end

    def empty?

    end

end



