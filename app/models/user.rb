class User < ActiveRecord::Base

  # Authentication
  devise :database_authenticatable, :trackable, :validatable
  
  # Relationships
	has_many :blog_posts
	has_and_belongs_to_many :applications
  
end
