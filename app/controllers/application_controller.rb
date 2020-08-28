class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permited_parameters

  private

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:family_name,:first_name,:family_name_reading,:first_name_reading,:birthday])
  end
  
end

