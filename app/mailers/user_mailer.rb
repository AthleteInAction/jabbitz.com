class UserMailer < ActionMailer::Base
  
  default from: 'no-reply@jabitz.com'

  def request_password_reset user

  	@user = user
  	mail to: @user.email, subject: 'Jabitz: Password Reset'

  end

end