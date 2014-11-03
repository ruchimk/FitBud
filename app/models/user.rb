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

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "fitbuddefault.jpg"
  validates_attachment_content_type :avatar, :content_type => ["image/jpeg", "image/gif", "image/png"]
  geocoded_by :address
  after_validation :geocode

  def admin?
    if self.admin
    end
  end

  def address
    [location, zip_code].compact.join(', ')
  end

end
