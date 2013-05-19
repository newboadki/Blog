class AddImageSrcToApps < ActiveRecord::Migration
  def change
  	add_column(:applications, :image_src, :string)
  end
end
