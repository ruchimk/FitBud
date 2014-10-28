class UserActivity < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  validates_presence_of :user_id, :activity_id
  validates_uniqueness_of :activity_id, scope: :user_id

  # def self.add_activity(activity, user) #add the language to the user
  #   unless UserActivity.exists?(activity_id: activity.id, user_id: user.id)
  #     transaction do
  #       create!(activity_id: activity.id, user_id: user.id
  #     end
  # end

  # def self.remove_language(activity, user)
  #   association = self.where(activity_id: activity.id, user_id: user.id)
  #   self.delete(association)
  # end

end

