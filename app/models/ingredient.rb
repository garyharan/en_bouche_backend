class Ingredient < ApplicationRecord
  belongs_to :recipe
  acts_as_list scope: :recipe_id
end
