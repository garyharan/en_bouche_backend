class AddHasMabyAssociationBetweenRecipesAndTechniques < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes_techniques, id: false do |t|
      t.belongs_to :recipe
      t.belongs_to :technique
    end
  end
end
