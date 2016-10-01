# == Schema Information
#
# Table name: submissions
#
#  id            :integer          not null, primary key
#  assignment_id :integer          not null
#  answer        :text             not null
#

class Submission < ActiveRecord::Base
  validates :assignment, presence: true
  validates :answer, presence: true
  validate :before_due_date

  belongs_to :assignment
  belongs_to :homework

  def homework
    assignment.homework
  end

  private

  # Error if the submission is after the due date
  def before_due_date
    errors.add(:submission, "it's past the due date.") if Date.today > homework.due_date
  end
end
