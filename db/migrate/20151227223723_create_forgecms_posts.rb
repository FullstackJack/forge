class CreateForgecmsPosts < ActiveRecord::Migration
  def change
    create_table :forgecms_posts do |t|
      t.integer :user_id
      t.integer :category_id, default: 0
      t.string :title
      t.text :body
      t.integer :status, default: 0
      t.integer :visibility, default: 0
      t.datetime :published_at
      t.string :slug
      t.timestamps null: false
    end

    add_index :forgecms_posts, :slug
  end
end
