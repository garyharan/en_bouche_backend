json.recipe do
  json.id recipe.id
  json.name recipe.name
  json.notes recipe.notes
  json.language recipe.language

  json.ingredients recipe.ingredients, :id, :name, :quantity, :position, :unit

  json.steps recipe.steps, :id, :body, :position

  json.techniques recipe.techniques, :id, :name
end
