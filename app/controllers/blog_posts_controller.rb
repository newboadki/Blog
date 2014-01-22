class BlogPostsController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found 
  
  def index
  	@posts = BlogPost.ordered_by_created_at('DESC');
  	  	  	   
  	respond_to do |format|
  		format.html
  		format.js { render('partial_templates/replace_content_with_ajax', :locals => {:template_name => 'blog_posts/index.html.erb'}) }
  	end
  end
  
  def show
    @blog_post = BlogPost.where(parameterised_title: params[:id]).first!
  end
  
  private
  
  def record_not_found
    render text: "404 Not Found", status: 404
  end
  
end
