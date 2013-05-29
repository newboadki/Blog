class BlogPost < ActiveRecord::Base
  belongs_to :user
  scope :ordered_by_created_at, lambda { |order_type| order("created_at #{order_type}") }
end
