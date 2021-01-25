class MaxIntSet
  def initialize(max)                                 #  0      1     2     3
    @store = Array.new(max, false)          # max= 4 ;[false, true, true ,false]
  end                                       # max= 4 hash[5] = true [{5: true}, {12: true}, {3: false}] [5,12]

  def insert(num)
    is_valid?(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num > @store.length - 1 || num < 0
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
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

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
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
