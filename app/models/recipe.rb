class Recipe < ActiveRecord::Base
	has_many :meals
	has_many :people, through: :meals
	has_many :reviews, through: :meals
	has_many :ingredients
	has_many :steps

	validates_presence_of :name, :serving_size
  validate :at_least_one_step?

  accepts_nested_attributes_for :steps

  private

  def at_least_one_step?
    errors.add(:base, 'must add at least one step') if steps.blank?
  end

end
