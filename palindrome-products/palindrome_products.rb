class Palindromes
  Palindrome = Struct.new(:value, :factors)

  def initialize(max_factor:, min_factor: 1)
    @max, @min = max_factor, min_factor
  end

  def generate
    candidates.each do |pair|
      product = pair.reduce(:*)
      palindromes[product] << pair if palindrome? product
    end
  end

  def largest
    Palindrome.new(*palindromes.max)
  end

  def smallest
    Palindrome.new(*palindromes.min)
  end

  private

  def candidates
    (@min..@max).to_a.repeated_combination(2).lazy
  end

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end

  def palindromes
    @palindromes ||= Hash.new { |hash, key| hash[key] = [] }
  end
end