class StaticContentController < ApplicationController

  def home
  	@section_title = "What this is about" # Needs to be here in case the request is not AJAX  	
    respond_to_replacing_content_with_ajax('static_content', 'home', @section_title)
  end

  # def curriculum
  #     respond_to_for_static_content("Resume", "curriculum")
  # end
    
end
