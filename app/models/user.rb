class User < ActiveRecord::Base
  has_many :user_activities
  has_many :activities, through: :user_activities, foreign_key: :user_id

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :matches
  has_many :partners, :through => :matches, :class_name =>'User'

  has_many :received_messages, class_name: 'Message', foreign_key: :recipient_id
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id

  validates_presence_of :username, :email, :location

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def admin?
    if self.admin
    end
  end

end
