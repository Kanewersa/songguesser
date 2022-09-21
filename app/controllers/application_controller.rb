class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account_code, :name])
  end

  def authenticate_admin!
    is_admin = user_signed_in? ? current_user.admin : false

    raise ActionController::RoutingError.new('Not Found') unless is_admin

    authenticate_user!
  end
end
