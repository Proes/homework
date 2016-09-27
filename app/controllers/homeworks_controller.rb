class HomeworksController < ApplicationController
  def index
    if current_user.role == 'student'
      @homeworks = Homework.joins(:assignments).where(assignments: {user_id: current_user.id})
    else
      @homeworks = Homework.where(user_id: current_user.id)
    end
  end

  def show
    @homework = Homework.find(params[:id])
    @assignments = current_user.role == 'student' ? student_assignments : all_assignments
  end

  private

  def student_assignments
    current_user.assignments
  end

  def all_assignments
    @homework.assignments
  end
end
