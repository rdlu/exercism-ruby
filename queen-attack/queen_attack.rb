class Queens
  def initialize(white: [], black: [])
    raise ArgumentError.new 'Queens outside of bounds' \
      unless white.all? { |i| (0..7).include?(i) } and black.all? { |i| (0..7).include?(i) }
    raise ArgumentError.new 'Queens with same initial position' if white == black

    @white = {i: white.first, j: white.last}
    @black = {i: black.first, j: black.last}
  end

  def attack?
    same_row? or same_column? or same_diagonal?
  end

  def same_row?
    @white[:i] == @black[:i]
  end

  def same_column?
    @white[:j] == @black[:j]
  end

  def same_diagonal?
    (@black[:i] - @white[:i]).abs == (@black[:j] - @white[:j]).abs
  end
end