class DashboardController < ApplicationController
  respond_to :html, :xls
  before_filter :authenticate_user!
  
  def userprofile
    @users = User.all.excludes(:id => current_user.id)
    @surveys = Survey.all.excludes(:id => current_user.id)
    @survey = Survey.new(params[:survey])
    @title = "User Profile"
    respond_with @surveys
  end
  
end 
