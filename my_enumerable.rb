module Enumerable
  def my_each()
    if !block_given?
      return self.to_enum
    end
    ln = self.length-1
    if self.is_a?(Array)
      0.upto(ln) do |i|
        yield(self[i])
      end
    else
      self.keys.my_each do |i|
        yield(i, self[i])
      end
    end
    return self
  end

  def my_each_with_index()
    if !block_given?
      return self.to_enum
    end
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
    return self
  end

  def my_select()
    if !block_given?
      return self.to_enum
    end
    ln = self.length-1
    if self.is_a?(Array)
      res = []
      0.upto(ln) do |i|
        if yield(self[i])
          res << self[i]
        end
      end
    else
      res = {}
      self.my_each do |i, j|
        k = i, j
        if yield(k)
          res[i] = j
        end
      end
    end
    return res
  end

  def my_all?()
    ln = self.length-1
    if self.is_a?(Array)
      if !block_given?
        0.upto(ln) do |i|
          if !self[i]
            return false
          end
        end
        return true
      end
      0.upto(ln) do |i|
        if yield(self[i]) == false
          return false
        end
      end
      return true
    else
      if !block_given?
        self.my_each do |i, j|
          k = i, j
          if !k
            return false
          end
        end
        return true
      end
      self.my_each do |i, j|
        k = i, j
        if yield(k) == false
          return false
        end
      end
      return true
    end
  end

  def my_any?()
    ln = self.length-1
    if self.is_a?(Array)
      if !block_given?
        0.upto(ln) do |i|
          if self[i]
            return true
          end
        end
        return false
      end
      0.upto(ln) do |i|
        if yield(self[i]) == true
          return true
        end
      end
      return false
    else
      if !block_given?
        self.my_each do |i, j|
          k = i, j
          if k
            return true
          end
        end
        return false
      end
      self.my_each do |i, j|
        k = i, j
        if yield(k) == true
          return true
        end
      end
      return false
    end
  end
 
  def my_none?()
    ln = self.length-1
    if self.is_a?(Array)
      if !block_given?
        0.upto(ln) do |i|
          if self[i]
            return false
          end
        end
        return true
      end
      0.upto(ln) do |i|
        if yield(self[i]) == true
          return false
        end
      end
      return true
    else
      if !block_given?
        self.my_each do |i, j|
          k = i, j
          if k
            return false
          end
        end
        return true
      end
      self.my_each do |i, j|
        k = i, j
        if yield(k) == true
          return false
        end
      end
      return true
    end
  end

  def my_count()
    return self.length
  end

  def my_map(*st)
    if st[0] == nil
      if !block_given?
        return self.to_enum
      end
      if self.is_a?(Array)
        res = []
        ln = self.length-1
        0.upto(ln) do |i|
          res << yield(self[i])
        end
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
        0.upto(ln) do |i|
          res << st[0].call(self[i])
        end
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
      start.upto(ln) do |i|
        res = yield(res, self[i])
      end
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

