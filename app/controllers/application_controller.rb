class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "default"

  include SessionsHelper

  before_action :set_locale
	
  def set_locale
	   I18n.locale = params[:locale] || extract_locale_from_accept_language_header || I18n.default_locale
	   logger.debug "* Locale set to '#{I18n.locale}'"
  end

  def default_url_options(options={})
    I18n.locale == I18n.default_locale ? {} : { :locale =>  I18n.locale }
  end

  private

  def extract_locale_from_accept_language_header
    logger.debug request.env['HTTP_ACCEPT_LANGUAGE']
    #request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}-[A-Z]{2}/).first
	  request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
