class Series
  # @param [String|Array] series
  def initialize(series)
    @digits = if series.respond_to? :chars
                series.chars
              else
                series.to_a  # defensive strategy for non strings
              end
  end

  # @param [Integer] length
  # @return [Array]
  def slices(length)
    raise ArgumentError.new "Length #{length} not in range for this series" if length > @digits.length

    @digits.each_cons(length).map(&:join)
  end
end