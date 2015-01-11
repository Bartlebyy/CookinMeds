class Recipe < ActiveRecord::Base
	has_many :meals
	has_many :people, through: :meals
	has_many :reviews, through: :meals
	has_many :ingredients
	has_many :steps

	validates_presence_of :name, :serving_size
end