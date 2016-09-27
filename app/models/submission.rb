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

  belongs_to :assignment

  def question
    assignment.homework.question
  end
end
