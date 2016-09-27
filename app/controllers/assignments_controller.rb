class AssignmentsController < ApplicationController

  def show
    @assignment = Assignment.find(params[:id])
    @homework = @assignment.homework
    @submissions = @assignment.submissions
  end

end
