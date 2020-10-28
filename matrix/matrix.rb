class Matrix
  attr_reader :rows

  # @param [String] m_string
  def initialize(m_string)
    @rows = m_string.lines.map do |line|
      line.split(' ').map(&:to_i)
    end
  end

  # @return [Array[Numeric]]
  def columns
    rows.transpose
  end
end