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
    # This redirect is technically not necessary as it would be much better to just use
    # some authorization system, and a student could still access other
    # pages not intended for them. However this is just an example and
    # an authorization system is out of the scope of this story.
    unless current_user.teacher?
      return redirect_to assignment_path(@homework.assignment_for_user(current_user).id)
    end
    @assignments = @homework.assignments
  end
end
