# frozen_string_literal: true

class User < ApplicationRecord
  has_many :images
  has_many :categories, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscribers, dependent: :destroy

  after_initialize :set_default_language, if: :new_record?

  def set_default_language
    self.language ||= I18n.locale
  end

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates_integrity_of :avatar
  validates_processing_of :avatar

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_later
  end

  def self.from_omniauth(auth, lang = nil)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      Rails.logger.info(auth.info)
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.avatar = auth.info.image
      user.language = lang || I18n.default_locale
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id id_value uid provider email encrypt_password reset_password_token first_name last_name avatar role language created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[categories comments subscribers images likes]
  end
end
