class CreateForgecmsCategories < ActiveRecord::Migration
  def change
    create_table :forgecms_categories do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :body
      t.timestamps null: false
    end
  end
end
