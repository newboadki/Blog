class StaticContentController < ApplicationController

	def home			
		respond_to do |format|
			format.html {}
			format.js { render('partial_templates/replace_content_with_ajax', :locals => {:template_name => 'static_content/home.html.erb'}) }
		end
	end

	def curriculum
	end


# Main Menu

# <li>
# 	<%= link_to(home_path({:locale => 'en'}) ) do %>
# 		<%= image_tag("uk-flag.jpg", {:class => "locale-flag"}) %>
# 	<% end %>					
# </li>			

# <li>
# 	<%= link_to(home_path({:locale => 'es'}) ) do %>
# 		<%= image_tag("spain-flag.jpg", {:class => "locale-flag"}) %>
# 	<% end %>					
# </li>		

end
