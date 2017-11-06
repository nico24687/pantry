require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/recipe'

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

  def test_it_can_restock
    pantry = Pantry.new

    pantry.restock("Cheese", 10)

    assert_equal 10, pantry.stock_check("Cheese")
  end 

  def test_it_can_add_to_stock
    pantry = Pantry.new

    pantry.restock("Cheese", 10)
    pantry.restock("Cheese", 20)

    assert_equal 30, pantry.stock_check("Cheese")
  end 
  
  def test_it_has_shopping_list
    pantry = Pantry.new

    assert_equal({},pantry.shopping_list)
  end

  def test_it_can_add_recipe_to_shopping_list
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    pantry = Pantry.new
    pantry.add_to_shopping_list(r)

    assert_equal({"Cheese" => 20, "Flour" => 20}, pantry.shopping_list)
  end

end
