class Admin::DashboardsController < ApplicationController
  
  before_action :authenticate_user!
  
  # Collects all the required information about different models to show in one view 
  def summary
    blog_posts = BlogPost.ordered_by_created_at('DESC');
    @report = { :blog_posts =>  blog_posts }
  end
  
end
