class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num >= @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    if is_valid?(num)
      @store[num] = false
    end
  end

  def include?(num)
    if is_valid?(num)
      return @store[num]
    else
      return false
    end
  end

  private

  def is_valid?(num)
    return num < @store.length && num > 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !include?(num) 
      self[num] << num
    end
  end

  def remove(num)
    if include?(num) 
      self[num].delete(num)
    end
  end

  def include?(num)
    index = num % num_buckets
    @store[index].include?(num)
  end


  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % num_buckets
    @store[index] 
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
    index = num % num_buckets
    @store[index].include?(num)
  end

  private

  def [](num)
      index = num % num_buckets
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
