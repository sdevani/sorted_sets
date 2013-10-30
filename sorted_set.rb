class BasicArraySortedSet
  # Create your internal data structure here. It should be an empty array
  def initialize
  end

  def name
    "Basic Array"
  end

  # Use the array's native insert method
  def insert(element)
  end

  # Use the array's native include method
  def include?(element)
  end

  # Use the array's native sort method
  def get_sorted_array
  end
end

# Similar to above, use the hash's internal methods to implement
# the sorted set's methods
class HashSortedSet
  def initialize
  end

  def name
    "Basic Hash"
  end

  def insert(element)
  end

  def include?(element)
  end

  def get_sorted_array
  end
end

# Internally use an array to represent the set
# Maintain alphabetical order within the array, so that you can return
# it when asking for sorted array
class ArraySortedSet
  def initialize
  end

  def name
    "Sorted Array"
  end

  # Insert the element at the proper index to maintain the sort order
  def insert(element)
  end

  def include?(element)
  end

  # You should be able to simply return the original array
  def get_sorted_array
  end
end


class BinaryArraySortedSet
  def initialize
  end

  def name
    "Bsearch Array"
  end

  # Insert the element and maintain sorted order
  def insert(element)
  end

  # Search for the element using binary search
  def include?(element)
  end

  # Return the original array (it should be sorted)
  def get_sorted_array
  end

  # A little helper method to help you implement binary search
  # This method should run as follows
  #   If the subset has 0 or 1 element, do a simple search
  #   If the subset has more than 1 element...
  #     Find the midpoint of the range
  #     Compare if the middle element is higher or lower than your element
  #       If the element is higher
  #         Do a binary_search on the lower half
  #       If the element is lower
  #         Do a binary search on the upper half
  def binary_search(from_index, to_index, element)
  end
end
