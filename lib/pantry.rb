class Pantry
  attr_reader :stock,
              :shopping_list,
              :cookbook
              
  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
    @cookbook = []
  end

  def stock_check(ingredient)
    stock[ingredient]
  end

  def restock(ingredient,amount)
    stock[ingredient] += amount
  end 

  def add_to_shopping_list(recipe)
    shopping_list.merge!(recipe.ingredients) do |ingredient, old_amount, new_amount|
      new_amount + old_amount
     end 
  end

  def print_shopping_list
    shopping_list.map do |ingredient,amount|
      "* #{ingredient}: #{amount}"
    end.join("\n")
  end

  def add_to_cookbook(recipe)
    cookbook << recipe
  end

  def what_can_i_make
    # go through cookbook
    # compare each recipe to stock
    # - go through ingredients
    # - compare recipe ingredients to stock
    # return recipe name if we have enough stock

    cookbook.select do |recipe|
      recipe.ingredients.
        select { |ingredient, quantity| stock_check(ingredient) < quantity }.
        empty?
    end.map(&:name)
  end
  
end
