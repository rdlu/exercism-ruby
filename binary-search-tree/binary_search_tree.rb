class Bst
  attr_reader :data, :left, :right

  # @param [Numeric] root
  def initialize(root)
    @data = root
    @left = nil
    @right = nil
  end

  # @param [Numeric] new_data
  def insert(new_data)
    if new_data <= data
      push_left(new_data)
    else
      push_right(new_data)
    end
  end

  
  # @param [Proc] block
  def each(&block)
    return enum_for(:each) unless block_given?
    left.each(&block) if left
    block.call(data)
    right.each(&block) if right
  end

  private

  # @param [Numeric] new_data
  def push_left(new_data)
    left.insert(new_data)
  rescue NoMethodError
    @left = Bst.new(new_data)
  end

  # @param [Numeric] new_data
  def push_right(new_data)
    right.insert(new_data)
  rescue NoMethodError
    @right = Bst.new(new_data)
  end
end