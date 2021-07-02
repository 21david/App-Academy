class Stack
    def initialize
        @data = []
    end

    def push(el)
        @data.push(el)
    end

    def pop
        @data.pop
    end

    def peek
        @data[-1]
    end

    def empty?
        @data.empty?
    end

    def to_s
        "[#{@data.join(', ')}]"
    end
end

stack = Stack.new

# creating a stack of plates from the bottom up
stack.push("plate 1") # bottom plate
stack.push("plate 2")
stack.push("plate 3")
stack.push("plate 4")
stack.push("plate 5") # top plate

# removing plates from the top, one by one
puts stack.pop until stack.empty?
