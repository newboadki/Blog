require 'spec_helper'

describe "apps/index" do
  
  it "displays all the apps" do
    assign(:apps, [
      stub_model(Application, :name => "slicer", :description => "How to slice a dyce", :image_src => "slicer.png"),
      stub_model(Application, :name => "dicer", :description => "How to dyce in a yeahcer", :image_src => "dycer.png")
    ])

    render

    rendered.should contain("slicer")
    rendered.should contain("dicer")
  end

end
