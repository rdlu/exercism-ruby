module Series
  # It converts a +series+ of digits/characters to an array of grouped slices with size +length+
  # Example: Series.slices('01234', 2) returns %w[01 12 23 34]
  # @param [String] series
  # @param [Integer] length
  # @return [Array]
  def self.slices(series, length)
    return [] if length < 1
    series.chars.each_cons(length).map(&:join)
  end
end