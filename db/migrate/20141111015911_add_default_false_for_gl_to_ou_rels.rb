class AddDefaultFalseForGlToOuRels < ActiveRecord::Migration
  def change
  	change_column :ou_rels, :gleader, :boolean, default: false
  end
end
