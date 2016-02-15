class FizzBuzz

  def say(number)
    if divisible_by_3?(number) && divisible_by_5?(number)
      return 'FizzBuzz'
    elsif divisible_by_3?(number)
      return 'Fizz'
    elsif divisible_by_5?(number)
      return 'Buzz'
    else
      return number
    end
  end

  def divisible_by_3?(number)
    return number % 3 == 0
  end

  def divisible_by_5?(number)
    return number % 5 == 0
  end
end
