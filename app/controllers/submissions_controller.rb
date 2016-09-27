class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new(assignment_id: params[:assignment][:id])
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      flash[:notice] = "Submission saved!"
      redirect_to @submission
    else
      flash[:error] = "Something went wrong. Please try again."
      render :new
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:assignment_id, :answer)
  end

end
