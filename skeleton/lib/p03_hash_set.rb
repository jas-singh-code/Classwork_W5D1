class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count >= num_buckets
    if !self[key].include?(key)
      self[key] << key
      @count += 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
     @count -= 1 if self[key].delete(key)
  end

  private

  def [](ele)
    # optional but useful; return the bucket corresponding to `num`
    @store[(ele.hash % num_buckets)]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    new_store = @store  
    @store = Array.new(num_buckets * 2) {Array.new}
    new_store.flatten.each { |num| insert(num) }
  end
end
