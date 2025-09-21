# frozen_string_literal: true

class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscribers, dependent: :destroy
  has_many :user_actions, dependent: :destroy

  after_initialize :set_default_language, if: :new_record?
  after_create :send_welcome_email

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def set_default_language
    self.language ||= I18n.locale
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

  class << self
    def from_omniauth(auth, lang = nil)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user_params(user, auth, lang)
      end
    end

    def user_params(user, auth, _lang)
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.avatar = auth.info.image
      user.language = I18n.default_locale
    end
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id id_value uid provider email encrypt_password reset_password_token first_name last_name avatar role language created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[categories comments subscribers images likes user_actions]
  end
end
