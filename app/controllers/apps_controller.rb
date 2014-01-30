class AppsController < ApplicationController

  @@APPS_PER_ROW = 4

  def index

  	# Create the rows
    @apps = Application.all.ordered_by_created_at('DESC')
    number_of_rows = (@apps.count.to_f / @@APPS_PER_ROW.to_f).ceil()
    @rows = []    
    i = 0
    while (i < number_of_rows)
    	offset = (@@APPS_PER_ROW * i)
    	limit = (offset + @@APPS_PER_ROW - 1) # -1 because we are calculating an index.
    	@rows << @apps[offset .. limit]
    	i += 1
    end

    # response
  	respond_to do |format|
  		format.html
  		format.js { render('apps/prepare_javascript_for_apps', :locals => {:template_name => 'apps/index.html.erb'}) }
  	end
  end

  def show
  	@app = Application.find(params[:id])
  end


end
