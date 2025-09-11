# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: t('welcome-gallery'))
  end

  def subscribe_email(user)
    @user = user
    mail(to: @user.email, subject: t('subscribe'))
  end

  def add_image_email(category, user)
    @category = category
    @users = user
    mail(to: @users.email, subject: t('new-photo'))
  end
end
