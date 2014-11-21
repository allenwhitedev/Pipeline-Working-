class OeRelsController < ApplicationController
  #before_action :signed_in_user

  def create
    #?@event = Event.find(params[:id])
    @organization = Organization.find(params[:oe_rel][:attended_id])
    @event.attend!(@organization) #current_event could be created and used here possibly
    redirect_to @event
  end

  def destroy
    #?@event = Event.find(params[:id])
    @organization = Organization.find(params[:id]).attended
    @event.unattend!(@organization) #current_event could be created and used here possibly
    redirect_to @event
  end
  
end