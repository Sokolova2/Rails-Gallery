class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Rails Gallery')
  end

  def subscribe_email(user)
    @user = user
    mail(to: @user.email, subject: 'You have subscribed successfully')
  end

  def image_email(category, user)
    @category = category
    @users = user
    mail(to: @users.email, subject: "A new photo has been added to the category: #{@category.slug}")
  end
end
