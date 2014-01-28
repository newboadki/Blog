class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_i18n_locale_from_params
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found 
  
  protected

  def set_i18n_locale_from_params
  	if (params[:locale])
  		if (I18n.available_locales.include?(params[:locale].to_sym))
  			I18n.locale = params[:locale]
  		else
  			flash.now[:notice] = "#{params[:locale]} translation not available"
  			logger.error flash.now[:notice]  			
  		end
  	end
  end

  def default_url_options
  	{locale: I18n.locale }
  end

  def record_not_found
    render text: "404 Not Found", status: 404
  end

end
