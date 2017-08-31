class StaticContentController < ApplicationController

  def home
  	@section_title = "" # Needs to be here in case the request is not AJAX
    respond_to_replacing_content_with_ajax('static_content', 'home', @section_title)
  end


  # From ApplicationController --

  def set_theme
    @theme = HOME_PAGE_THEME
  end

end
