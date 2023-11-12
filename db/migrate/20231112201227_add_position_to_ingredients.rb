class AddPositionToIngredients < ActiveRecord::Migration[7.1]
  def change
    add_column :ingredients, :position, :integer
  end
end
