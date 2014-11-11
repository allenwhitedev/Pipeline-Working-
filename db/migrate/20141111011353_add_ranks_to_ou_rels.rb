class AddRanksToOuRels < ActiveRecord::Migration
  def change
  	add_column :ou_rels, :gleader, :boolean
  	add_index :ou_rels, :gleader
  	add_column :ou_rels, :second_rank, :boolean, default: false
  	add_column :ou_rels, :third_rank, :boolean, default: false
  	add_column :ou_rels, :fourth_rank, :boolean, default: false
  	add_column :ou_rels, :fifth_rank, :boolean, default: false
  end
end
