class AddSecondDescriptionToApplications < ActiveRecord::Migration
  def change
  	add_column(:applications, :second_description, :text)
  end
end
