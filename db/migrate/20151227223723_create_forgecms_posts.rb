class CreateForgecmsPosts < ActiveRecord::Migration
  def change
    create_table :forgecms_posts do |t|
      t.integer :user_id
      t.integer :category_id, default: 0
      t.string :title
      t.text :body
      t.integer :status, default: 0
      t.integer :visibility, default: 0
      t.datetime :publish_date
      t.string :slug
      t.timestamps null: false
    end
  end
end
