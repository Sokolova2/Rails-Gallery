class User < ApplicationRecord
  include MailForm::Delivery
  has_many :images
  has_many :categories

  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  validates_integrity_of :avatar
  validates_processing_of :avatar

  def headers
    {
      :subject => 'Welcome to Rails Gallery. We nice to see you! You can log in follow the link: http://localhost:3000/users/sign_in',
      :from => 'apponrails2025@gmail.com',
      :to => email
    }
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.avatar = auth.info.image
    end
  end
end
