class Course < ApplicationRecord
	mount_uploader :image, ImageUploader

	belongs_to :user
	has_many :sections
	has_many :enrollments

	validates :title, presence: true
	validates :description, presence: true
	validates :cost, presence: true

	def time_formatted
		created_at.strftime('%Y-%M-%d')
	end
end
