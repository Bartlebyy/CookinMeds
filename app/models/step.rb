class Step < ActiveRecord::Base
	belongs_to :recipe
	has_many :images

	validates_presence_of :text

  acts_as_list scope: :recipe
end
