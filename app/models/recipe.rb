class Recipe < ApplicationRecord
  has_many :ingredients, -> { order(position: :asc) }, dependent: :destroy
  has_and_belongs_to_many :techniques

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  has_many :steps, -> { order(position: :asc) }, dependent: :destroy
  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true

  searchkick
  scope :search_import, -> { includes(:ingredients, :techniques, :steps) }

  def search_data
    {
      ingredients: ingredients.map(&:name),
      techniques: techniques.map(&:name),
      steps: steps.map(&:body)
    }
  end

  LANGUAGES = %w(en fr).freeze
end
