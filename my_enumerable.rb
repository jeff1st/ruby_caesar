module Enumerable
  def my_each()
    ln = self.length-1
    0.upto(ln) do |i|
      yield(self[i])
    end
  end
end

class MakeArrayEnum < Array
  include Enumerable
  def initialize()
    @arr ||= []
  end
end

class MakeArray
  def initialize()
    @arr ||= []
  end
end
