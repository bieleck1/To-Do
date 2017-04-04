class Task < ApplicationRecord
	belongs_to :list

	validates_presence_of :title
	validates :title, length: { :maximum => 50 }

	def done?
		is_done == true
	end
end
