#
# Calculator class to handle operations with comma separated numbers
#
class Calculator
  #
  # Class method to handle addition of number, passed as comma seperated string
  #
  # @param [String] number_str comma seperated string of integers
  #
  # @return [Integer] Sum of numbers
  #
  def self.add(number_str)
    # Return 0 if the number_str is empty, i.e. received empty string
    return 0 if number_str.empty?

    # Split the string with the delimener `,`, then change the type for all to integer and sum to get the result
    number_str.split(",").map(&:to_i).sum
  end
end
