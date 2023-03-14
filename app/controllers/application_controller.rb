# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale

  def default_url_options
    return {} if I18n.locale == I18n.default_locale

    { lang: I18n.locale }
  end

  protected

  def configure_permitted_parameters
    attributes = %i[first_name last_name phone address]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
