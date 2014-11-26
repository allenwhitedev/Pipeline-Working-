class EuRelsController < ApplicationController
  #before_action :signed_in_user

  def create
    @event = Event.find(params[:eu_rel][:attended_id])
    if codes_match?
      current_user.attend!(@event)
      flash[:success] = "You are now checked in to this event"
      redirect_to @event
    else
      flash[:danger] = "The checkin code does not match"
      redirect_to @event
    end
  end

  def add_reminder
    if EuRel.exists?(params[:event_id]) 
      flash[:danger] = "Exists"
      EuRel.find(params[:event_id]).update_attribute(:reminder, true)
    else
      @event = Event.find(params[:event_id])
      current_user.remind_me!(@event)
      #EuRel.find(params[:event_id]).update_attribute(:reminder, true)
    end
      respond_to do |format|
      format.html { redirect_to events_url}
      format.js
    end
    #EuRel.find(params[:event][:attended_id]).update_attribute(:reminder, true)
  end

  def destroy
    @event = EuRel.find(params[:id]).attended
    current_user.unattend!(@event)
    redirect_to @event
  end

  def codes_match?
    params[:code_attempt] == @event.checkincode
  end
  
end