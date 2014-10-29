class UserMailer < ActionMailer::Base
  default from: "no-reply@pipeline.com"

  def account_active

  end

  def reset_password(user)
  	@user = user


  	mail to: user.email, subject: "Password Reset"
  end



end
