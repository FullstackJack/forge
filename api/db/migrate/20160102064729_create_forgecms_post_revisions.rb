class CreateForgecmsPostRevisions < ActiveRecord::Migration
  def change
    create_table :forgecms_post_revisions do |t|
      t.integer :post_id
      t.string :title
      t.text :body
      t.timestamp :created_at, null: false
    end
    add_reference :forgecms_posts, :post, index: true
  end
end
