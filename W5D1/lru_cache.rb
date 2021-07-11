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

      # if it wasn't there, then we just add it to the end and remove the least recently used item
      unless found
        @arr.shift
        @arr << added_ele
      end

    end

    def show
      # shows the items in the cache, with the LRU item first
      p @arr
    end

    private
    
    # shift all elements after index i to the left by 1 (deleting the item at index i)
    def shift(index)

        

    end

  end