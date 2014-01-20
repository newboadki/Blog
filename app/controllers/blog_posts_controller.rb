class BlogPostsController < ApplicationController
  def index
  	@posts = BlogPost.ordered_by_created_at('DESC');
  	  	  	   
  	respond_to do |format|
  		format.html
  		format.js { render('partial_templates/replace_content_with_ajax', :locals => {:template_name => 'blog_posts/index.html.erb'}) }
  	end
  end
end
