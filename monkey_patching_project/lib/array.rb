# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0

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
end

