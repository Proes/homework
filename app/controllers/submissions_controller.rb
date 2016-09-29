class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new(assignment_id: params[:assignment][:id])
    @homework = @submission.homework
  end

  def show
    @submission = Submission.find(params[:id])
    @homework = @submission.homework
  end

  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      flash[:notice] = "Submission saved!"
      redirect_to @submission
    else
      errors = @submission.errors.messages.map do |k,v|
        ([k.to_s.capitalize] + v).join(': ')
      end
      flash[:error] = errors.join(', ')
      redirect_to action: :new, assignment: {id: @submission.assignment_id}
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:assignment_id, :answer)
  end

end
