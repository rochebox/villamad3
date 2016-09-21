class NotificationMailer < ActionMailer::Base
  default from: "support@villamadeleine.com"

  def comment_added
  	mail(to: "rochebox@gmail.com",
  		subject: "A comment has been added to your place")
  end

  def sign_up_confirmation
  	mail(to: "rochebox@gmail.com",
  		subject: "Please confirm you sign up at Villa Madeleine Homeowners Association")
  end
end
