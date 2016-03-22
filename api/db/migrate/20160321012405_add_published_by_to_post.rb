class AddPublishedByToPost < ActiveRecord::Migration
  def change
    add_column :forge_posts, :published_by, :integer
  end
end
