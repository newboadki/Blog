require 'spec_helper'

describe AppsController do
  
  describe "index" do

    context "Title of the page" do

      it "should set the title when HTML request" do
        get 'index'
        assigns(:section_title).should == 'iOS Applications'
      end

      it "should set the title when AJAX request" do
        xhr :get, 'index'
        assigns(:section_title).should == 'iOS Applications'
      end

    end

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

    context "There are no apps" do
      before(:all) do
        Application.delete_all        
      end
      
      it "should have a 200 status code" do        
        get :index
        expect(response.status).to eq(200)
      end      
      
      it "should return the list of apps per row" do
        get :index
        assigns(:apps).map{|row| row}.should == []
      end      
      
    end
    
    context "There are apps" do
      
      before(:all) do
        Application.delete_all
        @app1 = Application.create(:name => "Carnavapp")
        @app2 = Application.create(:name => "Expensit")
        @app3 = Application.create(:name => "Todo List")
        @app4 = Application.create(:name => "Wassap")
        @app5 = Application.create(:name => "Angry Birds")
        @app6 = Application.create(:name => "Keynote")
      end
      
      it "should have a 200 status code" do
        get :index
        expect(response.status).to eq(200)
      end
      
      it "should return the descendantly ordered list rows of apps" do
        get :index
        
        # how to avoid this?
        @app1.reload; @app2.reload; @app3.reload; @app4.reload; @app5.reload; @app6.reload
                
        assigns(:apps).map{|p| p}.should == [@app6, @app5, @app4, @app3, @app2, @app1]
      end      
         
    end
    
  end
  
end