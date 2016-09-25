class Homework < ActiveRecord::Base
  validates :title, presence: true
  validates :question, presence: true
  validates :creator, presence: true

  belongs_to :creator, foreign_key: "user_id", class_name: "User"
end
