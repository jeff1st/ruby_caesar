module Enumerable
  def my_each()
    return to_enum if !block_given?

    ln = self.length-1
    if self.is_a?(Array)
      0.upto(ln) { |i| yield(self[i]) }
    else
      0.upto(ln) do |i|
        k = self.keys[i], self.values[i]
        yield(k)
      end
    end
    self
  end

  def my_each_with_index()
    return to_enum if !block_given?
    
    ln = self.length-1
    if self.is_a?(Array)
      0.upto(ln) do |i|
        yield(self[i], i)
      end
    else
      count = 0
      self.my_each do |i, j|
        k = i, j
        yield(k, count)
        count += 1
      end
    end
    self
  end

  def my_select()
    return to_enum if !block_given?
    
    ln = self.length-1
    if self.is_a?(Array)
      res = []
      0.upto(ln) do |i|
        res << self[i] if yield(self[i])
      end
    else
      res = {}
      self.my_each do |i, j|
        k = i, j
        res[i] = j if yield(k)
      end
    end
    return res
  end

  def my_all?()
    ln = self.length-1

    if self.is_a?(Array)
      if !block_given?
        0.upto(ln) do |i|
          return false if !self[i]
        end
        return true
      end
      0.upto(ln) do |i|
        return false if !yield(self[i])
      end
      return true
    else
      if !block_given?
        self.my_each do |i, j|
          k = i, j
          return false if !k
        end
        return true
      end
      self.my_each do |i, j|
        k = i, j
        return false if !yield(k)
      end
      return true
    end
  end

  def my_any?()
    ln = self.length-1
    if self.is_a?(Array)
      if !block_given?
        0.upto(ln) do |i|
          return true if self[i]
        end
        return false
      end
      0.upto(ln) do |i|
        return true if yield(self[i])
      end
      return false
    else
      if !block_given?
        self.my_each do |i, j|
          k = i, j
          return true if k
        end
        return false
      end
      self.my_each do |i, j|
        k = i, j
        return true if yield(k)
      end
      return false
    end
  end
 
  def my_none?()
    ln = self.length-1
    if self.is_a?(Array)
      if !block_given?
        0.upto(ln) do |i|
          return false if self[i]
        end
        return true
      end
      0.upto(ln) do |i|
        return false if yield(self[i])
      end
      return true
    else
      if !block_given?
        self.my_each do |i, j|
          k = i, j
          return false if k
        end
        return true
      end
      self.my_each do |i, j|
        k = i, j
        return false if yield(k)
      end
      return true
    end
  end

  def my_count()
    return self.length
  end

  def my_map(*st)
    if st[0] == nil
      return to_enum if !block_given?
      
      if self.is_a?(Array)
        res = []
        ln = self.length-1
        0.upto(ln) { |i| res << yield(self[i]) }
      else
        res = []
        self.my_each do |i, j|
          k = i, j
          res << yield(k)
        end
      end  
      return res
    else
      if self.is_a?(Array)
        res = []
        ln = self.length-1
        0.upto(ln) { |i| res << st[0].call(self[i]) }
      else
        res = []
        self.my_each do |i, j|
          k = i, j
          res << st[0].call(k)
        end
      end  
      return res
    end
  end

  def my_inject(*init)
    init[0] ? (start = 0; res = init[0]) : (start = 1; res = self[0])
    
    if self.is_a?(Array)
      ln = self.length-1
      start.upto(ln) { |i| res = yield(res, self[i]) }
    else
      self.my_each do |i, j|
        k = i, j
        res = yield(res, k)
      end
    end
    return res
  end
end

def multiply_els(arr)
  res = arr.my_inject(1) { |prod, i| prod * i }
  return res
end

