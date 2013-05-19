class AddImageSrcToBlogPosts < ActiveRecord::Migration
  def change
  	add_column(:blog_posts, :image_src, :string)
  end
end
