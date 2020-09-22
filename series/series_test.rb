require 'minitest/autorun'
require_relative 'series'

class SeriesTest < Minitest::Test
  def test_simple_slices_of_one
    series = '01234'
    assert_equal %w[0 1 2 3 4], Series.slices(series, 1)
  end

  def test_simple_slices_of_one_again
    # skip
    series = '92834'
    assert_equal %w[9 2 8 3 4], Series.slices(series, 1)
  end

  def test_simple_slices_of_two
    # skip
    series = '01234'
    assert_equal %w[01 12 23 34], Series.slices(series, 2)
  end

  def test_other_slices_of_two
    # skip
    series = '98273463'
    expected = %w[98 82 27 73 34 46 63]
    assert_equal expected, Series.slices(series, 2)
  end

  def test_simple_slices_of_two_again
    # skip
    series = '37103'
    assert_equal %w[37 71 10 03], Series.slices(series, 2)
  end

  def test_simple_slices_of_three
    # skip
    series = '01234'
    assert_equal %w[012 123 234], Series.slices(series, 3)
  end

  def test_simple_slices_of_three_again
    # skip
    series = '31001'
    assert_equal %w[310 100 001], Series.slices(series, 3)
  end

  def test_other_slices_of_three
    # skip
    series = '982347'
    assert_equal %w[982 823 234 347], Series.slices(series, 3)
  end

  def test_simple_slices_of_four
    # skip
    series = '01234'
    assert_equal %w[0123 1234], Series.slices(series, 4)
  end

  def test_simple_slices_of_four_again
    # skip
    series = '91274'
    assert_equal %w[9127 1274], Series.slices(series, 4)
  end

  def test_simple_slices_of_five
    # skip
    series = '01234'
    assert_equal ['01234'], Series.slices(series, 5)
  end

  def test_simple_slices_of_five_again
    # skip
    series = '81228'
    assert_equal ['81228'], Series.slices(series, 5)
  end

  def test_simple_slice_that_blows_up
    # skip
    series = '01234'
    assert_raises ArgumentError do
      Series.slices(series, 6)
    end
  end

  def test_more_complicated_slice_that_blows_up
    # skip
    slice_string = '01032987583'

    assert_raises ArgumentError do
      Series.slices(slice_string, slice_string.length + 1)
    end
  end

  def test_sequential_slices
    # skip
    series = '1234'
    assert_equal %w[12 23 34], Series.slices(series, 2)
    assert_equal %w[123 234], Series.slices(series, 3)
  end
end
