class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers.empty?

    delimiter_regex = /,|\n/
    if numbers.start_with?("//")
      delimiter_match = numbers.match(/\A\/\/(.+)\n(.*)\z/m)
      if delimiter_match
        escaped_delimiter = Regexp.escape(delimiter_match[1])
        delimiter_regex = Regexp.new(escaped_delimiter)
        numbers = delimiter_match[2]
      end
    end

    arr_numbers = numbers.split(delimiter_regex).map(&:to_i)
    # IGNORE numbers greater than 1000
    arr_numbers = arr_numbers.reject { |num| num > 1000 }

    negatives = arr_numbers.select { |num| num < 0 }
    raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}" if negatives.any?

    arr_numbers.sum
  end
end
