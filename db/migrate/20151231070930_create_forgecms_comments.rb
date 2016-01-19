class CreateForgecmsComments < ActiveRecord::Migration
  def change
    create_table :forgecms_comments do |t|
      t.integer :user_id
      t.string :body

      t.timestamps null: false
    end
  end
end
