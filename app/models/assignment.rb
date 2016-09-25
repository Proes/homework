# == Schema Information
#
# Table name: assignments
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Assignment < ActiveRecord::Base
  validates :user, presence: true
  validates :homework, presence: true

  belongs_to :user
  belongs_to :homework
end
