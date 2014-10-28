class User < ActiveRecord::Base
  has_many :user_activities
  has_many :activities, through: :user_activities, foreign_key: :user_id

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

 has_many :received_messages, class_name: 'Message', foreign_key: :recipient_id
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id

  validates_presence_of :username, :email, :location

  def admin?
    if self.admin
    end
  end

end
