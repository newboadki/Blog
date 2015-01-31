class StaticContentController < ApplicationController

  def home
    respond_to_replacing_content_with_ajax('static_content', 'home', "What this is about")
  end

  # def curriculum
  #     respond_to_for_static_content("Resume", "curriculum")
  # end
    
end
