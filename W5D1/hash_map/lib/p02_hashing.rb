class Integer
  # Integer#hash already implemented for you
end

class Array

  def hash
    hash_key = 123
    self.each.with_index do |ele, i|
      hash_key += (i.hash ^ ele.hash)
    end
    hash_key
  end
end

class String
  def hash
    # chars = self.split("")
    # # chars.each.with_index { |char| char.to_i.hash }
    # chars.map(&:to_i).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
