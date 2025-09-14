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

    numbers.split(delimiter_regex).map(&:to_i).sum
  end
end
