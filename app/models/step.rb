class Step < ActiveRecord::Base
	belongs_to :recipe
	has_many :images

	validates_presence_of :position, :text
end
