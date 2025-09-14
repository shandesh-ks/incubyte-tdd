class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers.empty?
    return numbers.to_i unless numbers.include?(',')

    numbers.split(',').map(&:to_i).sum
  end
end
