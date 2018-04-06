class Instructor::CoursesController < ApplicationController
	before_action :authenticate_user!

	def new
		@course = Course.new
	end

	def create
		@course = current_user.courses.create(course_params)

		if @course.valid?
			# Why do we only specify @course instance instead of @course[:id]?
			redirect_to instructor_course_path(@course)
		else
			# render new action with status of unprocessable_entity see http://guides.rubyonrails.org/layouts_and_rendering.html
			render :new, status: :unprocessable_entity
		end
	end

	def show
		@section = Section.new
		@lesson = Lesson.new
		if current_course.user != current_user
			return render plain: 'Unauthorized', status: :unauthorized
		end
	end

	private
	
	helper_method :current_course
	def current_course
		@course ||= Course.find(params[:id])
	end

	def course_params
		params.require(:course).permit(:title, :description, :cost, :image)
	end
end
