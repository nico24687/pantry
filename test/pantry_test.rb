require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_it_has_empty_stock_by_default
    pantry = Pantry.new

    assert_equal({}, pantry.stock)
  end

  def test_it_can_check_stock
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check("Cheese")
  end

end
