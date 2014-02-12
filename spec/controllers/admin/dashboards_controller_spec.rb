require 'spec_helper'

describe Admin::DashboardsController do

  describe "summary" do
    
    context "The user is not logged in" do
      before(:all) do
        User.delete_all
        @user = User.create(:name => "Roger", :email => "roger.that@army.com", :password => "confidential", :password_confirmation => "confidential")        
      end
      
      it "should redirect to the login page" do
        get :summary
        response.should redirect_to '/users/sign_in'
      end
    end
  
    context "The user is logged in" do
      
      before(:all) do
        User.delete_all
        @user = User.create(:name => "Roger", :email => "roger.that@army.com", :password => "confidential", :password_confirmation => "confidential")        
      end
      
      it "should be successful" do
        sign_in @user
        get :summary
        expect(response.status).to eq(200)
      end
      
      it "should populate the report" do
        sign_in @user
        get :summary
        assigns(:report).should_not be_nil
      end
      
    end
  end
end
