class CreateForgecmsTags < ActiveRecord::Migration
  def change
    create_table :forgecms_tags do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
