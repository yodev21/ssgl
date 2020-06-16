class ApplicationController < ActionController::Base
  before_action :admin_check
  layout :set_layout

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :profile])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :profile])
  end

  def set_layout
    if params[:controller].match(%r{\A(administrators)})
      Regexp.last.match[1]
    else
      "application"
    end
  end

  def admin_check
    if current_user.admin?
      redirect_to administrator_top_path(administrator_id: current_user.id).admin?
    end
  end
end
