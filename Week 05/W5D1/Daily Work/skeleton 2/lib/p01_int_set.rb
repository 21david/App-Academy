class MaxIntSet
  def initialize(max)
        @store = Array.new(max, false)
    end

    def store
      @store
    end

    def insert(num)
      if is_valid?(num)
        @store[num] = true
      else
        raise 'Out of bounds'
      end
    end

    def remove(num)
        @store[num] = false
    end

    def include?(num)
        @store[num]
    end

  private

  def is_valid?(num)
    if num > @store.length || num < 0
      return false
    else
      return true
    end
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
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


  private

  def [](num)
        @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(n)
      if !@store[n % @store.length].include?(n)
        @count += 1 
        resize! if @count >= @store.length
        @store[n % @store.length] << n 
      end
  end

  def remove(n)
      if @store[n % @store.length].include?(n)
        @count -= 1
        @store[n % @store.length].delete(n)
      end
  end

  def include?(n)
      @store[n % @store.length].include?(n)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_size = @store.length * 2
        new_store = Array.new(new_size) { Array.new }
        @store.each do |arr|
            arr.each do |ele|
                new_store[ele % new_size] << ele
            end
        end
      @store = new_store
  end

end
