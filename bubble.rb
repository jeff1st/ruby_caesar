def bubble_sort(arr)
  # function to sort an array

  return false if !arr.is_a?(Array) # check if arr is an array
  
  swap = 1
  while swap != 0
    swap = 0
    0.upto(arr.length-2) do |i|
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        swap += 1
      end
    end
  end

  return arr
end


