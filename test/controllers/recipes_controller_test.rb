require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
  end

  test "should get index" do
    get recipes_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_url
    assert_response :success
  end

  test "should create recipe" do
    assert_difference("Recipe.count") do
      post recipes_url, params: { recipe: { instructions: @recipe.instructions, language: @recipe.language, name: @recipe.name } }
    end

    assert_redirected_to recipe_url(Recipe.last)
  end

  test "should create ingredients with units for recipe" do
    assert_difference("Recipe.count", 1) do
      assert_difference("Ingredient.count", 2) do
        post recipes_url, params: {
          recipe: {
            name: "Pear",
            ingredients_attributes: {
              "0" => { name: "Pear", quantity: "1", unit: nil },
              "1" => { name: "Knife", quantity: "1", unit: "ml" }
            },
            instructions: "Cut pear... eat pair",
            language: "en"
          }
        }
      end
    end
    assert Recipe.last.ingredients.last.name == "Knife"
    assert Recipe.last.ingredients.last.unit == "ml"
  end

  test "should show recipe" do
    get recipe_url(@recipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_url(@recipe)
    assert_response :success
  end

  test "edit should allow ingredients to display" do
    get edit_recipe_url(recipes(:no_ingredients_recipe))
    assert_response :success
    assert_not_nil assigns(:recipe)
    assert_not_empty assigns(:recipe).ingredients
  end

  test "should update recipe" do
    patch recipe_url(@recipe), params: { recipe: { instructions: @recipe.instructions, language: @recipe.language, name: @recipe.name } }
    assert_redirected_to recipe_url(@recipe)
  end

  test "should allow deletion of ingredients" do
    assert_difference("Ingredient.count", -1) do
      patch recipe_url(@recipe), params: {
        recipe: {
          name: "Pear",
          ingredients_attributes: {
            "0" => { id: @recipe.ingredients.first.id, name: @recipe.ingredients.first.name, quantity: @recipe.ingredients.first.quantity },
            "1" => { id: @recipe.ingredients.last.id, name: @recipe.ingredients.last.name,  quantity: @recipe.ingredients.last.quantity, _destroy: "1" }
          },
          instructions: "Cut pear... eat pair",
          language: "en"
        }
      }
    end
  end

  test "should allow positioning of ingredients" do
    assert @recipe.ingredients.first.name  == "Sel"
    assert @recipe.ingredients.last.name   == "Épaule de porc"

    patch recipe_url(@recipe), params: {
      recipe: {
        ingredients_attributes: {
          "0" => { id: @recipe.ingredients.first.id, position: 2 },
          "1" => { id: @recipe.ingredients.last.id, position: 1 }
        },
        language: "en"
      }
    }

    assert @recipe.ingredients.reload.first.name == "Épaule de porc"
    assert @recipe.ingredients.reload.last.name == "Sel"
  end

  test "should destroy recipe" do
    assert_difference("Recipe.count", -1) do
      delete recipe_url(@recipe)
    end

    assert_redirected_to recipes_url
  end
end
