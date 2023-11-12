require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test "should receive ingredients nested attributes" do
    recipe = Recipe.new(name: "Test Recipe", ingredients_attributes: [{ name: "Test Ingredient", quantity: 1 }])
    assert recipe.save
    assert_equal 1, recipe.ingredients.count
  end

  test "should delete nested ingredients when destroy is called" do
    @recipe = recipes(:one)
    assert @recipe.ingredients.any?
    assert_difference("Ingredient.count", -1) do
      @recipe.update(ingredients_attributes: [{ id: @recipe.ingredients.first.id, _destroy: "1" }])
    end
  end
end
