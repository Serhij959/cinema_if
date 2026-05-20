class ApplicationController < ActionController::Base

  before_action :set_locale
  before_action :store_return_to, if: :devise_controller?

  def set_locale
    I18n.locale = params[:locale] || :uk
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def after_sign_in_path_for(resource)
    session.delete(:user_return_to) || root_path(locale: I18n.locale)
  end

  def after_sign_up_path_for(resource)
    session.delete(:user_return_to) || root_path(locale: I18n.locale)
  end

  private

  def store_return_to
    session[:user_return_to] = params[:return_to] if params[:return_to].present?
  end

end