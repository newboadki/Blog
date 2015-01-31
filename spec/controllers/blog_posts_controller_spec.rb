require 'spec_helper'

describe BlogPostsController do

  describe "index" do

    context "Templates being rendered" do

      it "should render replace_content_with_ajax when ajax request" do
        xhr :get, 'index'
        response.should render_template 'partial_templates/replace_content_with_ajax'
      end

      it "should render with ajax if format is js" do      
        xhr :get, 'index'
        response.content_type.should == Mime::JS
      end

      it "should not render with ajax if format is html" do      
        get :index
        response.content_type.should == Mime::HTML
      end

    end

    context "there are no blog posts" do
      before(:all) do
        BlogPost.delete_all        
      end
      
      it "should have a 200 status code" do        
        get :index
        expect(response.status).to eq(200)
      end      
      
      it "should return the list of blog posts" do
        get :index
        assigns(:posts).map{|p| p}.should == []
      end      
      
    end
    
    context "there are blog posts" do
      
      before(:all) do
        BlogPost.delete_all
        @blog_post1 = BlogPost.create(:title => "A new beginning")
        @blog_post2 = BlogPost.create(:title => "Robust software is yet to be discovered")
        @blog_post3 = BlogPost.create(:title => "Fantastic")        
      end
      
      it "should have a 200 status code" do
        get :index
        expect(response.status).to eq(200)        
      end   
      
      it "should return the descendantly ordered list of blog posts" do        
        get :index
        
        # how to avoid this?
        @blog_post1.reload
        @blog_post2.reload
        @blog_post3.reload     
        
        assigns(:posts).map{|p| p}.should == [@blog_post3, @blog_post2, @blog_post1]
      end      
         
    end
    
  end
  
  describe "show" do
    
    before(:all) do
      BlogPost.delete_all
      @blog_post1 = BlogPost.create(:title => "A new beginning", :parameterised_title => "a-new-beginning")
      @blog_post2 = BlogPost.create(:title => "Robust software is yet to be discovered", :parameterised_title => "robust-siftware-is-yet-to-be-discovered")
      @blog_post3 = BlogPost.create(:title => "Fantastic", :parameterised_title => 'fantastic')        
    end
    
    context "requesting an existing permalink" do
      it "should have a 200 status code" do
        get :show, {:id => 'a-new-beginning'}
        expect(response.status).to eq(200)
      end      
      
      it "should return the blog post" do
        get :show, {:id => 'a-new-beginning'}
        assigns(:blog_post).should eq(@blog_post1)
      end      
      
    end
    
    context "requesting a non existing permalink" do
      it "should have a 404 status code" do
        get :show, {:id => 'great-news'}
        expect(response.status).to eq(404)        
      end      
    end

    context "requesting a number as blog id" do
      it "should have a 404 status code" do
        get :show, {:id => 3}
        expect(response.status).to eq(404)      
      end      
    end
    
  end
end
