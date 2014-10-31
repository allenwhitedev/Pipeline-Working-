class AddNameToOrganizations < ActiveRecord::Migration
  def change
  	add_column :organizations, :name, :string
  	add_index :organizations, :name
  end
end
