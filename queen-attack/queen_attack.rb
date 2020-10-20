class Queens
  def initialize(white: [], black: [])
    raise ArgumentError.new 'Queens outside of bounds' \
      unless white.all? { |i| (0..7).include?(i) } and black.all? { |i| (0..7).include?(i) }
    raise ArgumentError.new 'Queens with same initial position' if white == black

    @white = {i: white.first, j: white.last}
    @black = {i: black.first, j: black.last}
  end

  def attack?
    @white[:i] == @black[:i] or @white[:j] == @black[:j] \
            or (@black[:i] - @white[:i]).abs == (@black[:j] - @white[:j]).abs
  end
end