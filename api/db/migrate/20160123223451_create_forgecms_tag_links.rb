class CreateForgecmsTagLinks < ActiveRecord::Migration
  def change
    create_table :forgecms_tag_links do |t|
      t.integer :tag_id
      t.integer :target_id
      t.string :target_type
      t.timestamps null: false
    end
  end
end
