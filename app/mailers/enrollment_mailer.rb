class EnrollmentMailer < ApplicationMailer
	default from: 'noreply@flixter.com'

	def enrollment_email(enrollment)
		@user = enrollment.user
		@course = enrollment.course
		mail(
			to: @user.email,
			subject: 'Enrollment Confirmation'
		)
	end

end
