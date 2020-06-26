class UserMailer < ApplicationMailer
  default from: "30814754@qq.com"
  def welcome_email(user)
    @user = user
    @url  = 'https://github.com/lizeze'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
