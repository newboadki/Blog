require 'spec_helper'

describe "Routes" do
  
  it "should route the blog posts index correctly" do
    expect(:get => "en/blog_posts").to route_to(
           :controller => "blog_posts",
           :action => "index",
           :locale => "en"
    )
  end
end
