class Enrollment < ApplicationRecord
	belongs_to :course
	belongs_to :user
	after_create :send_enrollment_confirmation

	def send_enrollment_confirmation
		EnrollmentMailer.enrollment_email(self).deliver_now
	end

end
