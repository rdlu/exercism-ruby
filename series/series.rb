module Series
  # @param [String] series
  # @param [Integer] length
  # @return [Array]
  def self.slices(series, length)
    raise ArgumentError.new "Length #{length} not in range for this series" if length > series.size
    return [] if length < 1
    series.chars.each_cons(length).map(&:join)
  end
end