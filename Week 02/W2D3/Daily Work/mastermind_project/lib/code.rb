class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? { |ele| POSSIBLE_PEGS.has_key?(ele.upcase) }
  end

  def initialize(arr)
     if Code.valid_pegs?(arr) 
      @pegs = arr.map(&:upcase)
    else
      raise Error
    end
  end

  # basically get a new object with 'num' random pegs in its array
  def self.random(num)
    # create an array with 'num' random pegs from POSSIBLE_PEGS
    arr = []
    num.times { arr << POSSIBLE_PEGS.keys.sample }

    # pass that in to the initializer
    Code.new(arr)  # this will be returned
  end

  def self.from_string(str)
    Code.new(str.split(''))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code_obj)
    match = 0
    code_obj.pegs.each_index do |i|
      match += 1 if code_obj.pegs[i] == @pegs[i]
    end
    match
  end

  def num_near_matches(code_obj)
    copy1 = []
    @pegs.each { |ele| copy1 << ele }

    copy2 = []
    code_obj.pegs.each { |ele| copy2 << ele }

    copy2.each_with_index do |ele, i|
      if copy2[i] == copy1[i] 
        copy1[i] = '_'
        copy2[i] = ' '
      end
    end

    count = 0
    copy2.each do |ele|
      if copy1.include?(ele)
        count += 1
        # remove it from copy 1
        copy1[copy1.index(ele)] = '_'
      end
    end
    count
  end

  def ==(code_obj)
    return false if code_obj.pegs.length != @pegs.length
    return true if num_exact_matches(code_obj) == @pegs.length  # if they all match
    false
  end

end
