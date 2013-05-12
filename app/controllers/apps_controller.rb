class AppsController < ApplicationController

  def index
    @apps = Application.all
	respond_to do |format|
		format.html
		format.js { render('partial_templates/replace_content_with_ajax', :locals => {:template_name => 'apps/index.html.erb'}) }
	end
  end

  def show
  end

end
