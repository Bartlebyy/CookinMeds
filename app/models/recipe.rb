class Recipe < ActiveRecord::Base
	has_many :meals
	has_many :people, through: :meals
	has_many :reviews, through: :meals
	has_many :ingredients, dependent: :destroy
	has_many :steps, dependent: :destroy

	validates_presence_of :name, :serving_size

  accepts_nested_attributes_for :steps, :ingredients

  private
  #TODO For future queued for warning messages with ingredients and steps
  def at_least_one? association
    errors.add(:base, "must add at least one #{association}") if association.blank?
  end

end
