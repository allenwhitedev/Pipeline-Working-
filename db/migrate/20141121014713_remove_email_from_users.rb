class RemoveEmailFromUsers < ActiveRecord::Migration
  def up
  	remove_index :users, :email
  	remove_column :users, :email, :string
  end
end
