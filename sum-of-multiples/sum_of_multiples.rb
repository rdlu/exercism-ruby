class SumOfMultiples

  # @param [Array[Numeric]] factors
  def initialize(*factors)
    @factors = factors.reject(&:zero?)
  end

  # @param [Numeric] limit
  # @return [Numeric]
  def to(limit)
    @factors.flat_map { |m| (m...limit).step(m).to_a }.uniq.sum
  end
end
