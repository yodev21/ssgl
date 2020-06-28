# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :set_layout
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name image profile])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name image profile])
  end

  def set_layout
    if params[:controller].match(/\A(administrators)/)
      Regexp.last_match[1]
    else
      'application'
    end
  end
end
