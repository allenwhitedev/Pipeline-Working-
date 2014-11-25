class AddCheckedinAndReminderColumnsToEuRels < ActiveRecord::Migration
  def change
  	add_column :eu_rels, :checked_in, :boolean, default: false
  	add_column :eu_rels, :reminder, :boolean, default: false
  end
end
