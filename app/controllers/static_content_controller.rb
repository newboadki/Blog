class StaticContentController < ApplicationController

	def home		
    respond_to_for_static_content("What this is about", "home")    
	end

  # def curriculum
  #     respond_to_for_static_content("Resume", "curriculum")
  # end
  

  private
  
  def respond_to_for_static_content(title, template_name)
    @section_title = title
		respond_to do |format|
			format.html {}
			format.js { render('partial_templates/replace_content_with_ajax', :locals => {:template_name => "static_content/#{template_name}.html.erb"}) }
		end    
  end
  
end
