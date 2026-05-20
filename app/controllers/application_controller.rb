class ApplicationController < ActionController::Base

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || :uk
  end

  def default_url_options
    { locale: I18n.locale }
  end

end