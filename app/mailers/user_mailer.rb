class UserMailer < ApplicationMailer
  def welcome_email(post)
   @user = User.find(post.user_id)
    mail(to: @user.email, subject: 'Welcome to My Awesome Site') 
  end
end
