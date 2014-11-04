# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview


	# Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/reset_password
	def reset_password
		user = User.last
		user.reset_token = User.new_remember_token
		UserMailer.reset_password(user)
	end	

	def event_attendance
		# user = find organization and then search for users in that organization until you hit group leader 
		# then assign that to be the user here
		# event = find event
	end
end
