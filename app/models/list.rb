class List < ApplicationRecord
	belongs_to :user
	has_many :tasks, :dependent => :delete_all

	validates_presence_of :title
end
