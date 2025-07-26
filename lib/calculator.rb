#
# Calculator class to handle operations with comma separated numbers
#
class Calculator
  # Adds numbers provided in a delimited string format.
  #
  # Supports default delimiters: comma (`,`) and newline (`\n`).
  # Also supports custom delimiters defined using the `//<delimiter>\n` prefix format.
  #
  # Examples:
  #   Calculator.add("")                 # => 0
  #   Calculator.add("1,2,3")           # => 6
  #   Calculator.add("1\n2,3")          # => 6
  #   Calculator.add("//;\n1;2;3")      # => 6
  #
  # @param [String] number_str A string of integers separated by delimiters
  #
  # @return [Integer] The sum of all parsed integers in the string
  #
  def self.add(number_str)
    # Return 0 if the number_str is empty, i.e. received empty string
    return 0 if number_str.empty?

    # Get the delimiters and the number string with delimiters
    delimiters, delimited_str = detect_delimiters(number_str)

    # Split the string with the defined delimiters, then change the type for all to integer and sum to get the result
    delimited_str.split(delimiters).map(&:to_i).sum
  end

  #
  # Detects the delimiter used in the number string. By default, it supports comma (`,`)
  # and newline (`\n`) as delimiters. If the string starts with `//`, it extracts the
  # custom delimiter defined on the first line and uses it for splitting.
  #
  # Examples:
  #   detect_delimiters("1,2\n3")
  #   => [/,/, "1,2\n3"]
  #
  #   detect_delimiters("//;\n1;2;3")
  #   => [";", "1;2;3"]
  #
  # @param [String] number_str The input string containing numbers and optional custom delimiter
  #
  # @return [Array<(Regexp, String), (String, String)>] The delimiter (default regex or custom string) and the cleaned number string
  #
  def self.detect_delimiters(number_str)
    # List of default delimiters
    delimiters = /[,\n]/

    # Check for custom delimiters
    if number_str.start_with?("//")
      # Get the delimter string and the number string
      delimeter_str, number_str = number_str.split("\n")

      # Finally determine the delimiter
      delimiters = delimeter_str.split("//")[1]
    end

    # Return the delimiter and the delimited string
    return delimiters, number_str
  end
end
