class AppsController < ApplicationController

  @@APPS_PER_ROW = 4

  def index

    @section_title = "iOS Applications"
    
    # Create the rows
    @rows = []
    @apps = Application.all.ordered_by_created_at('DESC')
    populate_rows_with_apps()
        
  	respond_to do |format|
  		format.html
      format.js { render('partial_templates/replace_content_with_ajax', :locals => {:template_name => 'apps/index.html.erb'}) }
  	end
  end

  def show
  	@app = Application.find(params[:id])
  end


  private
  
  # Calculates the number of rows given the number of apps 
  # and the number of apps per row.
  def number_of_rows
    (@apps.count.to_f / @@APPS_PER_ROW.to_f).ceil()
  end
  
  # Populates @rows with the apps objects
  def populate_rows_with_apps
    number_of_rows.times do |i|
    	offset = (@@APPS_PER_ROW * i)
    	limit = (offset + @@APPS_PER_ROW - 1) # -1 because we are calculating an index.
    	@rows << @apps[offset .. limit]
    end    
    
  end
end
