require 'pry'

def sort(array)
  duration = array.length

  loop do
    swapped = false

    (duration - 1).times do |i|
      if array[i] > array[i + 1 ]
        array[i], array[i + 1] = array[i + 1],array[i]
        swapped = true
      end
    end
    break if not swapped
  end 
  array
end

a = [1,2,3,4,4,5,5,1,2,6,2]
p sort(a)
