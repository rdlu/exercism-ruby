module ETL
  def self.transform(legacy_data)
    legacy_data.flat_map do |score, letters|
      letters.map { |l| [l.downcase, score] }
    end.to_h
  end
end