module SessionsHelper
	
	# def sign_in(user)
	# 	remember_token = User.new_remember_token
	# 	cookies.permanent[:remember_token] = remember_token
	# 	user.update_attribute(:remember_token, User.digest(remember_token))
	# 	self.current_user = user
	# end

	# # Here because of parallel structure to remember_token and because sessionshelper is included in application, but this 
	# # may very well be moved to users helper(and probably wouldn't need to be included in the application controller)
	# def tbn
	# 	#user.update_attribute(:password_digest), User.digest(remember_token))
	# end
	

	# def signed_in?
	# 	!current_user.nil?
	# end

	# def sign_out
	# 	current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
	# 	cookies.delete(:remember_token)
	# 	self.current_user = nil
	# end

	# def current_user=(user)
	# 	@current_user = user
	# end

	# def current_user?(user)
	# 	user == current_user
	# end

	# def current_user
	# 	remember_token = User.digest(cookies[:remember_token])
	# 	@current_user ||= User.find_by(remember_token: remember_token)
	# end

	# def redirect_back_or(default)
	# 	redirect_to(session[:return_to] || default)
	# 	session.delete(:return_to)
	# end

	# def signed_in_user
	# 	unless signed_in?
	# 		flash[:warning] = "Please Sign In First" 
	# 		redirect_to signin_url
	# 	end
	# end


end
