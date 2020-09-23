module Change
  class ImpossibleCombinationError < StandardError; end
  class NegativeTargetError < StandardError; end

  # @param [Array] coins
  # @param [Integer] target
  def self.generate(coins, target)
    return [] if target.zero?
    raise NegativeTargetError.new 'Negative amount for change' if target < 0
    raise ImpossibleCombinationError.new 'Target value is wrong' if target < coins.min

    (1..((target / coins.min) + 1)).each do |i|
      # TODO: repeated_combination doesnt guarantee order, but will use anyway
      coins.sort!.repeated_combination(i).each do |candidate|
        return candidate if candidate.sum == target
      end
    end

    raise ImpossibleCombinationError.new('No change found')
  end
end

