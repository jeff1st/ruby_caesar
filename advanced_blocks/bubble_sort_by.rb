def bubble_sort_by(arr)
  # fonction to sort an array with passing a block

  return false if !arr.is_a?(Array) # check to see if arr is an array
  return arr if !block_given? # check if a block is given, else return array
  
  swap = 1
  
  while swap != 0
    swap = 0

    0.upto(arr.length-2) do |i|
      if yield(arr[i], arr[i+1]) > 0
        arr[i], arr[i+1] = arr[i+1], arr[i]
        swap += 1
      end
    end
  end

  return arr

end

