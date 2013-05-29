class Application < ActiveRecord::Base
  has_and_belongs_to_many :users

  scope :ordered_by_created_at, lambda { |order_type| order("created_at #{order_type}") }
end
