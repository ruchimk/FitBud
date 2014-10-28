class Match < ActiveRecord::Base
  belongs_to :user
  belongs_to :partner, class_name: 'User'

  validates_presence_of :user_id, :partner_id

  def self.one_side_confirmation(user, partner)
    request = self.find_by_user_id_and_partner_id(user, partner)
    request.status = 'accepted'
    request.save!
  end

  def self.request(user, partner)
    unless user == partner || self.exists?(user_id: user.id, partner_id: partner.id, status: 'pending') || self.exists?(user_id: user.id, partner_id: partner.id, status: 'accepted')
      # transaction block used when multiple statements need to be executed together or not at all
      transaction do
        self.create!(user_id: user.id, partner_id: partner.id, status: 'pending')
        self.create!(user_id: partner.id, partner_id: user.id, status: 'requested')
      end
    end
  end

  def self.confirm(user, partner)
    unless user == partner || self.exists?(user_id: user.id, partner_id: partner.id, status: 'accepted')
      transaction do
        one_side_confirmation(user, partner)
        one_side_confirmation(partner, user)
      end

    end
  end

end
