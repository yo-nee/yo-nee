class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    prev_node = prev
    prev_node.next = self.next
    self.next.prev = prev_node
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new # sentinel
    @tail = Node.new # sentinel
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index {|link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
   @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    self.each {|node| return node.val if node.key == key}
    nil
  end

  def include?(key)
    self.each {|node| return true if node.key == key}
    false
  end

  def append(key, val)
    # create a node with key, val
    # set last's next to this item
    # set this item's next to dummy tail
    # set dummy tail's prev to this item
    new_node = Node.new(key, val)
    last.next = new_node
    old_last = last # make a temp pointer to the old last node
    new_node.next = @tail
    @tail.prev = new_node
    new_node.prev = old_last
  end

  def update(key, val)
    self.each {|node|  node.val = val if node.key == key}
  end

  def remove(key)
    self.each {|node| node.remove if node.key == key}
  end

  def each
    ptr = first
    until ptr == @tail
      yield ptr
      ptr = ptr.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

# linked list consists of nodes

