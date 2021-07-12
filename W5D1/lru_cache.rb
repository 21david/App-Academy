# [least recently used, ..., ..., most recently used]
# so whenever we add an item, we add it to the back.
#   if the cache is full, we remove from the front (left side)
#   if the item is already in the cache, we take it out, shift everything, and add it to the end

class LRUCache
    def initialize(n)
        @max_capacity = n
        @arr = []
    end

    def count
        # returns number of elements currently in cache
        @arr.length
    end

    def add(added_ele)
        # adds element to cache according to LRU principle

        # we must first search the array to see if the item is already there
        found = false
        @arr.each_with_index do |ele, i|
            if ele == added_ele
                # this code 'bumps' the element to the top (to the most recently used slot)
                shift_elements(i)
                @arr[-1] = added_ele 
                found = true
            end
        end

        # if it wasn't there, then we just remove the least recently used item 
        # and add the new element to the end 
        unless found
            @arr.shift if count == @max_capacity
            @arr << added_ele
        end
    end

    def show
        # shows the items in the cache, with the LRU item first
        p @arr
    end

    private

    # shift all elements after index i to the left by 1 (deleting the item at index i)
    def shift_elements(index)
        (index...@arr.length-1).each do |i|
            @arr[i] = @arr[i+1]
        end
    end
end

cache = LRUCache.new(4)

cache.add("I walk the line")
cache.add(5)

p cache.count # => returns 2

cache.add([1,2,3])
cache.add(5)
cache.add(-5)
cache.add({a: 1, b: 2, c: 3})
cache.add([1,2,3,4])
cache.add("I walk the line")
cache.add(:ring_of_fire)
cache.add("I walk the line")
cache.add({a: 1, b: 2, c: 3})


cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]