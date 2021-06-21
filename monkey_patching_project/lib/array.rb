# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?

    max = self.max
    min = self.min
    max - min
  end

  def average
    return nil if self.length == 0

    sum = self.sum
    sum.to_f / self.length
  end

  def median
    return nil if self.length == 0

    if self.length.odd?
        return self.sort[self.length / 2]
    else
        sorted = self.sort
        ele1 = sorted[self.length / 2 - 1]
        ele2 = sorted[self.length / 2]
        (ele1 + ele2) / 2.to_f
    end
  end

  def counts
    count = Hash.new(0)
    self.each { |ele| count[ele] += 1}
    count
  end

  def my_count(val)
    counts[val]
  end

  def my_index(val)
    i = 0
    while i < self.length
        return i if self[i] == val
        i += 1
    end
  end

  def my_uniq
    new_arr = []
    self.each do |ele|
      if !new_arr.include?(ele)
        new_arr << ele
      end
    end
    new_arr
  end

  def my_transpose
    (0...self.length).map do |cur_index|
        self.map do |arr|
            arr[cur_index]
        end
    end
  end

end

