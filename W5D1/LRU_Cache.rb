class LRUCache # least recently used , can only get and set

    def initialize
        @size = size
        @cache = []
    end

    def count
        @cache.count
      # returns number of elements currently in cache
    end


    def add(el)
        if  @cache.include?(el)
            @cache.delete(el)
            @cache << el

        elsif count >= @size
            @cache.shift
            @cache << el
        else
        @cache << el
    end
  end
   # adds element to cache according to LRU principle

  def show
    p @cache 
  end
end
    # shows the items in the cache, with the LRU item first
  

    # private
    # helper methods go here!

