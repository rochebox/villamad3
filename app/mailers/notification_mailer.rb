class NotificationMailer < ActionMailer::Base
  default from: "support@villamadeleine.com"

 # *** use rochebox+EmailTest111@gmail.com
  def comment_added(comment)
  	@place = comment.place
  	@place_owner = @place.user
  	mail(to: @place_owner.email,
  		subject: "A comment has been added to #{@place.name}")
  end

  def sign_up_confirmation(user_email)
  	mail(to: "rochebox@gmail.com",
  		subject: "Please confirm you sign up at Villa Madeleine Homeowners Association")
  end
end
