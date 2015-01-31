class AppsController < ApplicationController

  def index
    @section_title = "iOS Applications"    
    @apps = Application.all.ordered_by_created_at('DESC')

    respond_to_replacing_content_with_ajax('apps', 'index')
  end

  def show
  	@app = Application.find(params[:id])
  end

end
