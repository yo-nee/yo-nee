
class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num) 
      self[num] << num
      @count += 1
    end

    if count >= num_buckets
      resize!
    end

  end

  def remove(num)
    if include?(num) 
      self[num].delete(num)
      @count -=1
    end
  end

  def include?(num)
      self[num].include?(num)
  end

  private

  def [](num)
      index = num.hash % num_buckets
      @store[index] 
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store += Array.new(num_buckets) { Array.new }
    (0...@store.length / 2).each do |i|
      @store[i].each do |ele|
        @store[i].delete(ele)
        self[ele] << ele 
      end
    end
  end
end


# class HashSet

#   attr_reader :count

#   def initialize(num_buckets = 8)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end

#   def insert(key)
#   end

#   def include?(key)
#   end

#   def remove(key)
#   end

#   private

#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`
#   end

#   def num_buckets
#     @store.length
#   end

#   def resize!
#   end
# end
