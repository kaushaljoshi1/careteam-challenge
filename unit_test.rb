require 'test/unit'
require_relative 'connected_components'

class UnitTest < Test::Unit::TestCase

  def return_actual matrix
    actual = (ConnectedComponents.new.get_groups matrix, 1),( ConnectedComponents.new.get_groups matrix, 0)
  end

  def test_simple
    actual = return_actual [[1,0,1,1],[0,1,0,0],[1,0,1,1],[1,0,0,0]]
    expected = [5,4]
    assert_equal(expected,actual)

    actual = return_actual [[0, 0, 1, 1], [0, 0, 1, 0], [1, 0, 0, 1], [1, 1, 1, 0]]
    expected = [3,3]
    assert_equal(expected,actual)

    actual = return_actual [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 0], [1, 1, 1, 1]]
    expected = [3,1]
    assert_equal(expected,actual)


  end

  def test_failure
    actual = return_actual [[1,0,1,1],[0,1,0,0],[1,0,1,1],[1,0,0,0]]
    expected = [5,4]
    assert_equal(expected,actual, "Answer should be#{expected}")

    actual = return_actual [[0, 0, 1, 1], [0, 0, 1, 0], [1, 0, 0, 1], [1, 1, 1, 0]]
    expected = [3,3]
    assert_equal(expected,actual, "Answer should be#{expected}")

    actual = return_actual [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 0], [1, 1, 1, 1]]
    expected = [3,1]
    assert_equal(expected,actual, "Answer should be#{expected}")

  end


end
