class ApplicationController < ActionController::Base

  before_action :authenticate_member!
  # this is so user needs to authenticate before using the app!

  # this is so we can permit other fields like first name and last name to be handled by devise
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  # this method will allow extra params to be used by devise, like first and last name.
  # This came from Devise's documentationg
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :membership_number, :authorized_for_app])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :membership_number, :authorized_for_app])
  end

  # this was added for Cors gem
  #config.middleware.insert_before 0, Rack::Cors do
  #  allow do
  #    origins '*'
  #    resource '*', headers: :any, methods: [:get, :post, :options, :patch, :put, :delete]
  #  end
  #end

end
