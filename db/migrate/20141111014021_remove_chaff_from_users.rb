class RemoveChaffFromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :organization, :string
  	remove_index :users, :code
  	remove_column :users, :code, :string
  end
end
