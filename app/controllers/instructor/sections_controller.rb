class Instructor::SectionsController < ApplicationController
	def new
		@section = Section.new
		@course = Course.find(params[:course_id])
	end

	def create
		@course = Course.find(params[:course_id])
		@section = @course.sections.create(section_params)
		redirect_to instructor_course_path(@course)
	end

	private

	def section_params
		params.require(:section).permit(:title)
	end

end
