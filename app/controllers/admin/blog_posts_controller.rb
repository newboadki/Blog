class Admin::BlogPostsController < ApplicationController
  
  before_action :authenticate_user!
  
  # Collects all the required information about different models to show in one view 
  def new 
    @blog_post = BlogPost.new
  end
  
  def create
    @blog_post = BlogPost.new(blog_post_params)
    @blog_post.user = User.first
    @blog_post.parameterised_title = @blog_post.title.parameterize
    
    if @blog_post.save
      redirect_to admin_dashboard_path
    else
      render :action => :new
    end
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
    render :action => :new
  end

  def update 
    @blog_post = BlogPost.where(parameterised_title: params[:id]).first!
    @blog_post.parameterised_title = @blog_post.title.parameterize
    
    if @blog_post.update(blog_post_params)
      redirect_to admin_dashboard_path, :notice => "sucess editing"
    else
      render :action => :edit, :notice => "Error updating"
    end
  end
  
  def destroy
    BlogPost.find(params[:id]).destroy
    redirect_to admin_dashboard_path
  end
  
  protected
  
  def blog_post_params
      params.require(:blog_post).permit(:title, :body, :image_src)
  end
  
end
