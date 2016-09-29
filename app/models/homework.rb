# == Schema Information
#
# Table name: homeworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  question   :text             not null
#  due_date   :datetime         not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Homework < ActiveRecord::Base
  validates :title, presence: true
  validates :question, presence: true
  validates :creator, presence: true

  belongs_to :creator, foreign_key: "user_id", class_name: "User"
  has_many :assignments, class_name: "Assignment"
  has_many :submissions, through: :assignments

  #Find an assignment for the homework given a user
  def assignment_for_user(user)
    assignments.where(user_id: user.id).first
  end
end
