class User < ActiveRecord::Base
	has_many :blog_posts
	has_and_belongs_to_many :applications
end
