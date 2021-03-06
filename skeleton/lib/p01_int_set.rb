class MaxIntSet
  attr_accessor :store
  def initialize(max)                                 #  0      1     2     3
    @store = Array.new(max, false)          # max= 4 ;[false, true, true ,false]
  end                                       # max= 4 hash[5] = true [{5: true}, {12: true}, {3: false}] [5,12]

  def insert(num)
    validate!(num)
    @store[num] = true      
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  def [](idx)
    @store[idx]
  end 

  private

  def is_valid?(num)
    if num > @store.length - 1 || num < 0
      return false
    else
      return true
    end
  end

  def validate!(num)
    raise "Out of bounds" if !is_valid?(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if include?(num)
      return false 
    else
      self[num] << num
    end
    true
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    #To look up a number in the set, modulo (%) the number by the set's length, 
    #and add it to the array at that index. If the integer is present in that bucket,
    # that's how we know it's included in the set.
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store


  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if num >= num_buckets
    if !self[num].include?(num)
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    @count -= 1 if self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    #make new store
    #put all elements in specified places depending on modulo new size
    # new_store = Array.new(num_buckets * 2) { Array.new }
    # @store.each { |num| new_store[num % (num_buckets * 2)] = num}
    # @store = new_store
    @count = 0
    new_store = @store  #= [[1],[2]]
    @store = Array.new(num_buckets * 2) {Array.new}
    new_store.flatten.each { |num| insert(num) }
  end
end
