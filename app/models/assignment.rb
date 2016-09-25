class Assignment < ActiveRecord::Base
  validates :user, presence: true
  validates :homework, presence: true

  belongs_to :user
  belongs_to :homework
end
