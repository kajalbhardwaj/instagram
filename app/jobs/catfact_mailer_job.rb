class CatfactMailerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    post = args[0] 
    UserMailer.welcome_email(post).deliver_now
  end
end
  
 
