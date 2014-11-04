class UserMailer < ActionMailer::Base
  default from: "no-reply@pipeline.com"

  def account_active

  end

  def reset_password(user)
  	@user = user


  	mail to: user.email, subject: "Password Reset"
  end

  def event_attendance(user, event)
  	@user = user
  	@event = event

  	mail to: user.email, subject: "#{event} Attendance"
  end


end
