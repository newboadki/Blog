require 'spec_helper'

describe "blog_posts/index" do

  it "displays all the blog posts" do

  	user = User.new(:name => 'McGregor')

    assign(:posts, [
      stub_model(BlogPost, :title => "Beginning", :body => "A new day", :user => user),
      stub_model(BlogPost, :title => "Bye Day", :body => "The day ends", :user => user),
      stub_model(BlogPost, :title => "Hey", :body => "Super cool", :user => user)
    ])

    render

    rendered.should contain("Beginning")
    rendered.should contain("A new day")

    rendered.should contain("Bye Day")
    rendered.should contain("The day ends")

    rendered.should contain("Hey")
    rendered.should contain("Super cool")
  end

end
