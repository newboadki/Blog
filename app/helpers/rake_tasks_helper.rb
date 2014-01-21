module RakeTasksHelper

  def populate_parameterised_blog_post_title
    BlogPost.all.each do |post|      
      post.update(parameterised_title: post.title.parameterize)
    end    
  end
  
end
