class Meal < ActiveRecord::Base
	belongs_to :person
	belongs_to :recipe
	belongs_to :review

	validates_presence_of :person, :recipe
	validates :uniqueness # combination of person_id and recipe_id should be unique
end