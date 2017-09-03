require 'spec_helper'

describe "blog_posts/show" do

  it "displays all the blog posts" do

  	user = User.new(:name => 'McGregor')

    assign(:blog_post, stub_model(BlogPost, :title => "Beginning", :body => "A new day", :user => user, :created_at => Time.now))

    render

    rendered.should contain("Beginning")
    rendered.should contain("A new day")

    rendered.should_not contain("Bye Day")
    rendered.should_not contain("The day ends")
    rendered.should_not contain("Hey")
    rendered.should_not contain("Super cool")

  end

end
