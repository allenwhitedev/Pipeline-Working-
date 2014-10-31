class OuRelsController < ApplicationController
  before_action :signed_in_user

  def create
    @organization = Organization.find(params[:ou_rel][:joined_id])
    current_user.join!(@organization)
    flash[:success] = "You are now a member of #{@organization.name}"
    redirect_to @organization
  end

  def destroy
    @organization = EuRel.find(params[:id]).joined
    current_user.unjoin!(@organization)
    redirect_to @organization
  end

  
end