class Course < ApplicationRecord
	belongs_to :user
	has_many :sections

	validates :title, presence: true
	validates :description, presence: true
	validates :cost, presence: true

	def time_formatted
		created_at.strftime('%Y-%M-%d')
	end
end
