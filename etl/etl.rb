module ETL
  def self.transform(legacy_data)
    Hash[*legacy_data.map do |score, letters|
      letters.map do |letter|
        [letter.downcase, score]
      end
    end.flatten]
  end
end