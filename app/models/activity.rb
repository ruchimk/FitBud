class Activity < ActiveRecord::Base
  has_many :user_activities
  has_many :users, through: :user_activities

  # ensure that title is present and at least 10 chars long
  validates :name, presence: true

end
