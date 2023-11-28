json.recipe do
  json.id recipe.id
  json.name recipe.name.gsub('"', "'")
  json.notes recipe.notes.gsub('"', "'")
  json.difficulty recipe.difficulty
  json.language recipe.language

  json.ingredients recipe.ingredients do |ingredient|
    json.id ingredient.id
    json.name ingredient.name.gsub('"', "'")
    json.quantity ingredient.quantity
    json.unit ingredient.unit
    json.position ingredient.position
  end

  json.steps recipe.steps do |step|
    json.id step.id
    json.body step.body.gsub('"', "'")
    json.position step.position
  end

  json.techniques recipe.techniques, :id, :name, :description
end
