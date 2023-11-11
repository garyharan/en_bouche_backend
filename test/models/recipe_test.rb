require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test "should receive ingredients nested attributes" do
    recipe = Recipe.new(name: "Test Recipe", ingredients_attributes: [{ name: "Test Ingredient", quantity: 1 }])
    assert recipe.save
    assert_equal 1, recipe.ingredients.count
  end
end
