require 'spec_helper'

describe AppsController do
  
  describe "index" do

    context "there are no apps" do
      before(:all) do
        Application.delete_all        
      end
      
      it "should have a 200 status code" do        
        get :index
        expect(response.status).to eq(200)
      end      
      
      it "should return the list of apps per row" do
        get :index
        assigns(:rows).map{|row| row}.should == []
      end      
      
    end
    
    context "there are blog posts" do
      
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
                
        assigns(:rows).map{|p| p}.should == [[@app6, @app5, @app4, @app3], [@app2, @app1]]
      end      
         
    end
    
  end
  
end