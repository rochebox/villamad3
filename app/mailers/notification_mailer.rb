class NotificationMailer < ActionMailer::Base
  default from: "support@villamadeleine.com"

  def comment_added
  	mail(to: "christopherroche@stmarksschool.org",
  		subject: "A comment has been added to your place")
  end

  def sign_up_confirmation
  	mail(to: "christopherroche@stmarksschool.org",
  		subject: "Please confirm you sign up at Villa Madeleine Homeowners Association")
  end
end
