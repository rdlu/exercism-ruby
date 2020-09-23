module Change
  class ImpossibleCombinationError < StandardError; end
  class NegativeTargetError < StandardError; end

  # @param [Array] coins
  # @param [Integer] target
  def self.generate(coins, target)
    candidate = []

    return [] if target.zero?
    raise NegativeTargetError.new 'Negative amount for change' if target < 0
    raise ImpossibleCombinationError.new 'Target value is wrong' if target < coins.min

    (1..((target / coins.min) + 1)).each do |i|
      coins.sort!.repeated_combination(i).each do |candidate|
        # I will not delay the short-circuit just to use `find` ("""better""" style) instead of `each`
        return candidate if candidate.sum == target
      end
    end

    raise ImpossibleCombinationError.new('No change found')
  end
end

