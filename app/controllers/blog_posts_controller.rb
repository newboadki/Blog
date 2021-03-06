class BlogPostsController < ApplicationController

  before_action :set_theme

  def index
    @section_title = t('page_sections.blog.title') # Needs to be here in case the request is not AJAX
    @posts = BlogPost.ordered_by_created_at('DESC');
    respond_to_replacing_content_with_ajax('blog_posts', 'index', @section_title)
  end

  def show
    @section_title = ""
    @blog_post = BlogPost.where(parameterised_title: params[:id]).first!
    respond_to_replacing_content_with_ajax('blog_posts', 'show', @section_title)
  end


  # From ApplicationController -- 

  def set_theme
    @theme = ARTICLES_PAGE_THEME
  end

end
