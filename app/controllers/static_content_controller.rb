class StaticContentController < ApplicationController

  def home
  	@section_title = "" # Needs to be here in case the request is not AJAX
    @theme = HOME_PAGE_THEME
    respond_to_replacing_content_with_ajax('static_content', 'home', @section_title)
  end

  # def curriculum
  #     respond_to_for_static_content("Resume", "curriculum")
  # end

end
