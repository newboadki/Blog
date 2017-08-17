class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Filters
  before_action :set_i18n_locale_from_params

  # Handling exceptions
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  HOME_PAGE_THEME = :home_page_style
  ARTICLES_PAGE_THEME = :articles_page_style

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

  def respond_to_replacing_content_with_ajax(folder_name, template_name, section_title, title = nil)
    respond_to do |format|
      format.html {}
      format.js { render('partial_templates/replace_content_with_ajax', :locals => {:template_name => "#{folder_name}/#{template_name}", :section_title => section_title}) }
    end
  end


end
