class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :menus, dependent: :destroy

  #before_save { |user| user.email = email.downcase }

  #validates :phone, presence: true, length: { maximum: 20 }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX },
  #          uniqueness: { case_sensitive: false }

end
