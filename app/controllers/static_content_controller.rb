class StaticContentController < ApplicationController

	def home		
    @section_title = "What this is about"	
		respond_to do |format|
			format.html {}
			format.js { render('partial_templates/replace_content_with_ajax', :locals => {:template_name => 'static_content/home.html.erb'}) }
		end
	end
  
end
