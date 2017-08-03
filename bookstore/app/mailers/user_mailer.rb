class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @user.update(confirm_token_send: Time.now)
    mail(to: user.email, subject: 'Hello')
  end

  def password_reset(user)
    @user = user
    mail(to: user.email, subject: 'Password Reset')
  end
end
