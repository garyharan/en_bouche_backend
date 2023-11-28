class AddDifficultyToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :difficulty, :integer
  end
end
