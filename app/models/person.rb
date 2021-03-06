class Person < ActiveRecord::Base
	belongs_to :user
	has_many :meals
	has_many :recipes, through: :meals
	has_many :reviews, through: :meals

	validates_presence_of :user
end