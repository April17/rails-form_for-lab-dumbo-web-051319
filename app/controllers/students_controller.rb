class StudentsController < ApplicationController
	def index
		@students = Student.all
	end

	def show
		@student = Student.find_by(id: params[:id])
	end

	def new
		@student = Student.new
	end

	def create
		student = Student.create(student_params(:first_name, :last_name))
		redirect_to "/students/#{student.id}"
	end

	def edit
		@student = Student.find_by(id: params[:id])
	end

	def update
		@student = Student.find_by(id: params[:id])
		@student.update(student_params(:first_name, :last_name))
		redirect_to student_path
	end
end

private

def student_params(*args)
  params.require(:student).permit(*args)
end
