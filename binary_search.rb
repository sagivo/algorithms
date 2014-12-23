class BinarySearch

  # searches for a value in sorted array
  #
  # @param array
  #            array to search in
  # @param value
  #            searched value
  # @return position of searched value, if it presents in the array or -1, if
  #         it is absent

  def search(array, value)
    middle_index = (array.length / 2)

    if array.length == 0
      puts "The Searched Value Doesn't exist in the list."
    elsif array[middle_index] == value
      puts 'Found in the list.'
    elsif array[middle_index] < value
      search(array[middle_index+1, array.length], value)
    elsif array[middle_index] > value
      search(array[0, middle_index], value)
    end
  end
end

ar = [23, 45, 67, 89, 123, 568]

binary = BinarySearch.new
binary.search(ar, 123)
