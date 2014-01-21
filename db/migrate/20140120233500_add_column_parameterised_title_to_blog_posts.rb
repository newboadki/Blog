class AddColumnParameterisedTitleToBlogPosts < ActiveRecord::Migration
  
  def change
      add_column :blog_posts, :parameterised_title, :string
  end
      
end
