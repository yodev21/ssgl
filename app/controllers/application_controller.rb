class ApplicationController < ActionController::Base
  layout :set_layout
  rescue_from StandardError, with: :rescue500
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :profile])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :profile])
  end

  def set_layout
    if params[:controller].match(%r{\A(administrators)})
      Regexp.last_match[1]
    else
      "application"
    end
  end

  def rescue500(e)
    render "errors/internal_server_error", status: 500
  end

end
