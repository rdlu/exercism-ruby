module RunLengthEncoding

  # @param [String] data
  def self.encode(data)
    data.gsub(/(.)\1+/) { |match| "#{match.size}#{match[0]}" }
  end

  def self.decode(data)
    data.gsub(/(\d+)([^0-9])/) { |_m| $2 * $1.to_i }
  end
end