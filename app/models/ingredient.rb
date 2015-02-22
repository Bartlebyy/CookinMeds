class Ingredient < ActiveRecord::Base
	belongs_to :recipe

	validates_presence_of :name, :measurement
	# validates :unit_is_valid # i.e. validate unitwise understands it

end