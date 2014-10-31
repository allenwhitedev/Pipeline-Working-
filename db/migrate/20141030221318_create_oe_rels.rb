class CreateOeRels < ActiveRecord::Migration
  def change
    create_table :oe_rels do |t|
      t.integer :attender_id
      t.integer :attended_id

      t.timestamps
    end
    add_index :oe_rels, :attender_id
    add_index :oe_rels, :attended_id
    add_index :oe_rels, [:attender_id, :attended_id], unique: true
  end
end
