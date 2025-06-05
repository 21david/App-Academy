class Queue
#  enqueue(el), dequeue, and peek.

    def initialize
        @data = []
    end

    # add element to the back
    def enqueue(el)
        @data.push(el)
    end

    # remove element from the front
    def dequeue
        @data.shift
    end

    # see the element in the front
    def peek
        @data[0]
    end

    def empty?
        @data.empty?
    end

end


queue = Queue.new

# adding people to a line at a coffee shop
queue.enqueue("David (1)")  # first in line
queue.enqueue("John (2)")
queue.enqueue("Mark (3)")
queue.enqueue("Susanna (4)")
queue.enqueue("Katy (5)")


# "take their orders"
puts queue.dequeue until queue.empty?
