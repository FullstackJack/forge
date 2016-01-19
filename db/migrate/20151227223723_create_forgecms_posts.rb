class CreateForgecmsPosts < ActiveRecord::Migration
  def change
    create_table :forgecms_posts do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.text :body
      t.date :publish_date
      t.string :slug
      t.timestamps null: false
    end
  end
end
