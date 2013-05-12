class CreateApplicationsUsers < ActiveRecord::Migration
  def change
  	  create_table :applications_users do |t|
      	t.references :application, index: true
		t.references :user, index: true
		
      	t.timestamps
    end
  end
end
