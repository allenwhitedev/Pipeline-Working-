class RemoveChaffFromEvents < ActiveRecord::Migration
  def up
  	remove_column :events, :attendance, :boolean
  	remove_column :events, :event_time, :datetime
  	remove_column :events, :organization, :string
  end
  #never added down for putting back in remove chaff files
end
