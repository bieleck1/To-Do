class Task < ApplicationRecord
	belongs_to :list

	def done?
		is_done == true
	end
end
