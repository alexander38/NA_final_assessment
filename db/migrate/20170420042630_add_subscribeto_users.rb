class AddSubscribetoUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :subscribe, :boolean, :default => false
  end
end
