class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:signup, keys: [:first_name, :lastname, :terms, :phoneno, :address, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :lastname, :terms, :phoneno, :address, :photo])
  end
end
