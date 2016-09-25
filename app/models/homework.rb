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
end
