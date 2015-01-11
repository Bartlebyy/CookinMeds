class Review < ActiveRecord::Base
	has_one :meal
	has_one :person, through: :meal
	has_one :recipe, through: :meal

	validates_presence_of :rating, :comment
	validates :rating, :between_one_and_five
	validates :comment, :minimum_length
end