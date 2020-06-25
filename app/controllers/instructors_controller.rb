class InstructorsController < ApplicationController

  def index
    @instructors = Instructor.all
  end

  def show
    @instructor = Instructor.find(params[:id])
    @sorted_students = @instructor.students.sort_by{|s| s.name}
    @average_student_age = @sorted_students.map{|s| s.age}.sum / @sorted_students.count
  end

end
