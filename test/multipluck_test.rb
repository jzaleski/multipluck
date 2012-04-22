require_relative 'test_helper'

class MultipluckTest < ActiveSupport::TestCase

  test "make sure normal pluck functionality still works" do
    Widget.create!(an_int: 5)
    assert_equal [5], Widget.pluck(:an_int)
  end

  test "normal pluck, multiple rows" do
    Widget.create!(an_int: 5)
    Widget.create!(an_int: 12)
    assert_equal [5, 12], Widget.pluck(:an_int)
  end

  test "same parameter twice" do
    Widget.create!(an_int: 5)
    assert_equal [[5, 5]], Widget.pluck([:an_int, :an_int])
  end

  test "multiple parameters" do
    Widget.create!(a_string: "cow", an_int: 5)
    assert_equal [[5, "cow"]], Widget.pluck([:an_int, :a_string])
    assert_equal [["cow", 5]], Widget.pluck([:a_string, :an_int])
  end

  test "multiple parameters / multiple rows" do
    Widget.create!(a_string: "cow", an_int: 5)
    Widget.create!(a_string: "dog", an_int: 12)
    assert_equal [[5,"cow"], [12, "dog"]], Widget.pluck([:an_int, :a_string])
  end

end
