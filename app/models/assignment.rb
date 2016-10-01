# == Schema Information
#
# Table name: assignments
#
#  id          :integer          not null, primary key
#  homework_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Assignment < ActiveRecord::Base
  validates :user, presence: true
  validates :homework, presence: true
  # Ensure records, not only columns, are unique
  validates_uniqueness_of :user_id, scope: :homework_id

  belongs_to :user
  belongs_to :homework
  has_many :submissions
end
