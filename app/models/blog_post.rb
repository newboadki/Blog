class BlogPost < ActiveRecord::Base
  belongs_to :user
  scope :ordered_by_created_at, lambda { |order_type| order("created_at #{order_type}") }
  
  def to_param
    self.parameterised_title
  end
  
end
