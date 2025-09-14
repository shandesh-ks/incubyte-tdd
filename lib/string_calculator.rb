class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers.empty?
    return numbers.to_i unless numbers.include?(',')

    nums = numbers.split(',')
    nums[0].to_i + nums[1].to_i
  end
end
