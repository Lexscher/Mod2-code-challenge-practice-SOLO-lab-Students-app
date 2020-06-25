class StudentsController < ApplicationController

  before_action :find_student, only: [:show, :edit, :update]
  before_action :allowed_params, only: [:create, :update]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
    @instructors = Instructor.all
  end

  def create
    @student = Student.new(allowed_params)
    if @student.valid?
      @student.save
      redirect_to instructor_path(@student.instructor)
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_student_path
    end    
  end

  def edit
    @instructors = Instructor.all
  end

  def update
    @student.update(allowed_params)
    redirect_to student_path(@student)
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def allowed_params
    params.require(:student).permit(:name, :major, :age, :instructor_id)
  end
  
end
