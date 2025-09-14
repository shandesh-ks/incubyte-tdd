class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers.empty?

    numbers.split(/,|\n/).map(&:to_i).sum
  end
end
