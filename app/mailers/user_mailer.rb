# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, from: 'karinasokolova252@gmail.com', subject: t('welcome-gallery'))
  end

  def subscribe_email(user)
    @user = user
    mail(to: @user.email, from: 'karinasokolova252@gmail.com', subject: t('subscribe'))
  end

  def add_image_email(category, user)
    @category = category
    @users = user
    mail(to: @users.email, from: 'karinasokolova252@gmail.com', subject: t('new-photo'))
  end
end
