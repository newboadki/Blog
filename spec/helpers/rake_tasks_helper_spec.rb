require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the RakeTasksHelper. For example:

describe RakeTasksHelper do
  describe "populate_parameterised_blog_post_title" do
    
    before(:all) do
      
      BlogPost.delete_all # can't this be prevented automatically?
      
      @blog_post1 = BlogPost.create(:title => "A new beginning")
      @blog_post2 = BlogPost.create(:title => "Robust software is yet to be discovered")
      @blog_post3 = BlogPost.create(:title => "Fantastic")      
    end
    
    it "should parameterise the title" do
      # Run the helper
      helper.populate_parameterised_blog_post_title
      
      # how to avoid this?
      @blog_post1.reload
      @blog_post2.reload
      @blog_post3.reload
      
      # expectations      
      @blog_post1.parameterised_title.should eq('a-new-beginning')
      @blog_post2.parameterised_title.should eq('robust-software-is-yet-to-be-discovered')
      @blog_post3.parameterised_title.should eq('fantastic')
    end
        
  end
end
