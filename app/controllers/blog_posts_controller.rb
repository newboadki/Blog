class BlogPostsController < ApplicationController
  
  def index
    @section_title = "Web Log"
    @posts = BlogPost.ordered_by_created_at('DESC');
  	  	  	   
    respond_to_replacing_content_with_ajax('blog_posts', 'index')

  end
  
  def show
    @blog_post = BlogPost.where(parameterised_title: params[:id]).first!
  end  
    
end
