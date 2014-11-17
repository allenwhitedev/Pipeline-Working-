module ApplicationHelper


	# may use custom implemntation to store location 
	def store_location
		session[:return_to] = request.url if request.get?
	end
end
