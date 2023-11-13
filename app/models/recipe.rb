class Recipe < ApplicationRecord
  has_many :ingredients, -> { order(position: :asc) }, dependent: :destroy
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  has_many :steps, -> { order(position: :asc) }, dependent: :destroy
  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true

  LANGUAGES = %w(en fr).freeze
end
