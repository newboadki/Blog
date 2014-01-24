describe "seed:populate_parameterised_blog_title" do

  include_context "rake"

  before do
    RakeTasksHelper.stub(:populate_parameterised_blog_post_title)
  end

  its(:prerequisites) { should include("environment") }

  it "populates the parameterised_title property of the existing blog posts" do
     subject.invoke
     RakeTasksHelper.should have_received(:populate_parameterised_blog_post_title)
  end
   
 end