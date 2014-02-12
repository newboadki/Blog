class Admin::DashboardsController < ApplicationController
  
  before_action :authenticate_user!
  
  # Collects all the required information about different models to show in one view 
  def summary
    @report = {}
  end
  
end
