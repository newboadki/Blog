class BlogPostsController < ApplicationController

  def index
    @section_title = "Web Log" # Needs to be here in case the request is not AJAX
    @posts = BlogPost.ordered_by_created_at('DESC');

    respond_to_replacing_content_with_ajax('blog_posts', 'index', @section_title)
  end

  def show
    @section_title = "Web Log" # Needs to be here in case the request is not AJAX
    @blog_post = BlogPost.where(parameterised_title: params[:id]).first!
  end

end
