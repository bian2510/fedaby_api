class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  rescue_from RailsParam::Param::InvalidParameterError, with: :handle_invalid_parameter
  
  def handle_record_not_found
    # Send it to the view that is specific for Post not found
    render status: :not_found
  end

  def handle_invalid_parameter
    # Send it to the view that is specific for bad request
    return render status: :bad_request
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :name, :last_name, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :username, :name, :last_name, :email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :last_name, :email, :password, :password_confirmation, :current_password])
  end
end
