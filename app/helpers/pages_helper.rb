module PagesHelper
	require 'date'
	
	def calendar(month, year)
		start_date = Date.new(year, month, 1)
		month != 12? end_date = Date.new(year, month+1, 1) : end_date = Date.new(year+1, 1, 1)
		month_days = (end_date-start_date).to_i 

		day_of_week = start_date.strftime("%w").to_i
		cal = "<table border='1'>"
		cal += "<tr>"
		days = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
		days.each do |day|
			cal += "<td>#{day}</td>"
		end
		cal += "</tr>"
		
		blank_counter = 0
		counter = 1
		
		#first row(w/ blank spaces)
		cal += "<tr>"
		day_of_week.times do |day|
			cal += "<td>&nbsp;</td>"
			blank_counter += 1
		end
		(7- day_of_week).times do |day|
			cal += "<td>#{day+1}</td>"
			counter += 1 
		end
		counter_offset = counter 
		cal += "</tr>"

		#second row
		cal += "<tr>"
		(7).times do |day|
			cal += "<td>#{day+counter_offset}</td>"
			counter += 1 
		end
		counter_offset = counter
		cal += "</tr>"

		#third row
		cal += "<tr>"
		(7).times do |day|
			cal += "<td>#{day+counter_offset}</td>"
			counter += 1  
		end
		counter_offset = counter
		cal += "</tr>"

		#fourth row(last row if first day of month is on Sunday but is filled up, so no issue :_)
		cal += "<tr>"
		(7).times do |day|
			cal += "<td>#{day+counter_offset}</td>"
			counter += 1 
		end
		counter_offset = counter
		cal += "</tr>"		

		#fifth row(sometimes the last row is the fifth row)
		if counter <= (month_days - 7) #<= rather than < because counter starts at 1, not 0 
			cal += "<tr>"
			(7).times do |day|
				cal += "<td>#{day+counter_offset}</td>"
				counter += 1 
			end
			counter_offset = counter
			cal += "</tr>"
		else
		end	

		#last row(w/ blank spaces)
		cal += "<tr>"
		(month_days - counter + 1).times do |day|
			cal += "<td>#{day+counter_offset}</td>"	
		end
		
		if blank_counter > 0 || month_days != 28
			(35 - blank_counter - month_days).times do |day|
				cal += "<td>&nbsp;</td>"	
			end
		end
		if blank_counter + month_days > 35
			(42 - blank_counter - month_days).times do |day|
				cal += "<td>&nbsp;</td>"
			end			
		end
		cal += "</tr>"
		cal += "</table>"
	
	end

end
