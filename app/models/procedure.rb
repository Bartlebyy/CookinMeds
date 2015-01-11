class Procedure < ActiveRecord::Base
	belongs_to :recipe
	has_many :steps

	validates_presence_of :recipe
	# validates :at_least_one_step
end
