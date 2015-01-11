class Step < ActiveRecord::Base
	belongs_to :procedure
	has_many :images

	validates_presence_of :position, :text
end
