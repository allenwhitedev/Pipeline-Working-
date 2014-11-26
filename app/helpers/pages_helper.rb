module PagesHelper
	require 'date'
	
	def calendar(month, year)
		start_date = Date.new(year, month, 1)
		month != 12? end_date = Date.new(year, month+1, 1) : end_date = Date.new(year+1, 1, 1)
		month_days = (end_date-start_date).to_i 

		day_of_week = start_date.strftime("%w").to_i
		cal = "<div class='calendar'>"
		cal += "<div class='cal-row dow'>"
		days = %w(Sun Mon Tue Wed Thu Fri Sat)
		days.each do |day|
			cal += "<li class='cal-dow'>#{day}</li>"
		end
		cal += "</div>"
		
		blank_counter = 0
		counter = 1
		
		#first row(w/ blank spaces)
		cal += "<div class='cal-row'>"
		day_of_week.times do |day|
			cal += "<li class='cal-day dropzone' id='inner-dropzone' '>&nbsp;</li>"
			blank_counter += 1
		end
		(7- day_of_week).times do |day|
			cal += "<li class='cal-day dropzone' id='inner-dropzone' '>#{day+1}</li>"
			counter += 1 
		end
		counter_offset = counter 
		cal += "</div>"

		#second row
		cal += "<div class='cal-row'>"
		(7).times do |day|
			cal += "<li class='cal-day dropzone' id='inner-dropzone' '>#{day+counter_offset}</li>"
			counter += 1 
		end
		counter_offset = counter
		cal += "</div>"

		#third row
		cal += "<div class='cal-row'>"
		(7).times do |day|
			cal += "<li class='cal-day dropzone' id='inner-dropzone' '>#{day+counter_offset}</li>"
			counter += 1  
		end
		counter_offset = counter
		cal += "</div>"

		#fourth row(last row if first day of month is on Sunday but is filled up, so no issue :_)
		cal += "<div class='cal-row'>"
		(7).times do |day|
			cal += "<li class='cal-day dropzone' id='inner-dropzone' '>#{day+counter_offset}</li>"
			counter += 1 
		end
		counter_offset = counter
		cal += "</div>"		

		#fifth row(sometimes the last row is the fifth row)
		if counter <= (month_days - 7) #<= rather than < because counter starts at 1, not 0 
			cal += "<div class='cal-row'>"
			(7).times do |day|
				cal += "<li class='cal-day dropzone' id='inner-dropzone' '>#{day+counter_offset}</li>"
				counter += 1 
			end
			counter_offset = counter
			cal += "</div>"
		else
		end	

		#last row(w/ blank spaces)
		cal += "<div class='cal-row'>"
		(month_days - counter + 1).times do |day|
			cal += "<li class='cal-day dropzone' id='inner-dropzone' '>#{day+counter_offset}</li>"	
		end
		
		if blank_counter > 0 || month_days != 28
			(35 - blank_counter - month_days).times do |day|
				cal += "<li class='cal-day dropzone' id='inner-dropzone' '>&nbsp;</li>"	
			end
		end
		if blank_counter + month_days > 35
			(42 - blank_counter - month_days).times do |day|
				cal += "<li class='cal-day dropzone' id='inner-dropzone' '>&nbsp;</li>"
			end			
		end
		cal += "</div>"
		cal += "</div>"
	
	end

end
