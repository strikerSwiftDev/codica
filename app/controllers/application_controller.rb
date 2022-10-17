class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  protected

  def after_sign_in_path_for(resource)
    return admin_dashboard_path if resource.admin?
    super
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
