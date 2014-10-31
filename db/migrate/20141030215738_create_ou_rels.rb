class CreateOuRels < ActiveRecord::Migration
  def change
    create_table :ou_rels do |t|
      t.integer :joiner_id
      t.integer :joined_id

      t.timestamps
    end
    add_index :ou_rels, :joiner_id
    add_index :ou_rels, :joined_id
    add_index :ou_rels, [:joiner_id, :joined_id], unique: true
  end
end
