class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(n)
      if !@store[n.hash % @store.length].include?(n)
          @count += 1 
          resize! if @count >= @store.length
          @store[n.hash % @store.length] << n
      end
  end

  def remove(n)
      @count -= 1
      @store[n.hash % @store.length].delete(n)
  end

  def include?(n)
      @store[n.hash % @store.length].include?(n)
  end
  
  
  private

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

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
