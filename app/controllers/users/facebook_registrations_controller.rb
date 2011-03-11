class Users::FacebookRegistrationsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def create
    @user = User.find_for_facebook_registration(params, current_user)
    
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => 'Facebook'
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = params[:registration_metadata]
      redirect_to new_user_registration_url
    end
  end
end