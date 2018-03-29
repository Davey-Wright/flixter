class EnrollmentsController < ApplicationController

	before_action :authenticate_user!

	def create
		# Enrollment.create(user_id: current_user[:id], course_id: params[:course_id])
		current_user.enrollments.create(course: current_course)
	end

	private

	def current_course
		@current_course ||= Course.find(params[:course_id])
	end

end
