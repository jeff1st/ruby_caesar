module Enumerable
  def my_each()
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
    ln = self.length-1
    0.upto(ln) do |i|
      yield(self[i], i)
    end
    return self
  end

  def my_select()
    ln = self.length-1
    res = []
    0.upto(ln) do |i|
      if yield(self[i])
        res << self[i]
      end
    end
    return res
  end

  def my_all?()
    ln = self.length-1
    0.upto(ln) do |i|
      if yield(self[i]) == false
        return false
      end
    return true
    end
  end

  def my_any?()
    ln = self.length-1
    0.upto(ln) do |i|
      if yield(self[i]) == true
        return true
      end
    end
    return false
  end
 
  def my_none?()
    ln = self.length-1
    0.upto(ln) do |i|
      if yield(self[i]) == true
        return false
      end
    end
    return true
  end

  def my_count()
    return self.length
  end

  def my_map()
    res = []
    ln = self.length-1
    0.upto(ln) do |i|
      res << yield(self[i])
    end
    return res
  end

  def my_inject(res=0)
    ln = self.length-1
    0.upto(ln) do |i|
      res=yield(res, self[i])
    end
    return res
  end

end

def multiply_els(arr)
  res = arr.my_inject(1) { |prod, i| prod * i }
  return res
end

