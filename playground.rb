require 'pry'

def merge_sort(array, sort_direction = {reverse: false})
  array_a, array_b, sorted = [], [], []
  return "Use another method" if array.length < 3
  until array.empty?
    n = array.length

    if n >= 4
      array_a, array_b = split_array(array)
      sorted = push_or_merge_to_sorted(sorted, array_a, array_b)
    elsif n == 3
      array_a = sort_array(array.slice!(0, 2))
      array_b = array[0]
      sorted = push_or_merge_to_sorted(sorted, array_a, array_b)
    elsif n == 2
      array_a = sort_array(array)
      sorted = sort_into_one(sorted.flatten, array_a)
    else
      sorted.push(array.slice!(0,1))
    end
  end
  sorted.flatten
end

def push_or_merge_to_sorted(sorted, array_a, array_b)
  if sorted.empty?
    sorted << sort_into_one(array_a, array_b)
  else
    new_sorted = sort_into_one(array_a, array_b)
    sorted = sort_into_one(sorted.flatten, new_sorted.flatten)
  end
  sorted
end

def sort_into_one(array_a, array_b)
  sorted = []
  until array_a.empty? || array_b.empty?
    if array_a[0] <= array_b[0]
      sorted.push(array_a.slice!(0,1))
    else
      sorted.push(array_b.slice!(0,1))
    end
  end

  remaining_array = return_not_empty_one(array_a, array_b)
  if remaining_array.length == 1
    sorted.push(remaining_array.slice!(0,1))
  elsif remaining_array.length > 1
    sorted = sort_into_one(sorted.flatten, remaining_array.flatten)
  end
  sorted.flatten
end

def return_not_empty_one(array_a, array_b)
  array_a.empty? ? array_b : array_a
end

def split_array(array)
  array_a = sort_array(array.slice!(0,2))
  array_b = sort_array(array.slice!(0,2))
  return array_a, array_b
end

def sort_array(array)
  sorted = []
  if array[0] <= array[1]
    sorted[0], sorted[1] = array[0], array[1]
  else
    sorted[0], sorted[1] = array[1], array[0]
  end
  sorted
end


array = [6, 8, 2, 9, 2, 4, 10, 1, 15]

sorted = merge_sort(array)

puts sorted
