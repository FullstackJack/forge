class RenameTablePrefixes < ActiveRecord::Migration
  def change
    rename_table :forgecms_categories, :forge_categories
    rename_table :forgecms_comments, :forge_comments
    rename_table :forgecms_posts, :forge_posts
    rename_table :forgecms_post_revisions, :forge_post_revisions
    rename_table :forgecms_settings, :forge_settings
    rename_table :forgecms_tags, :forge_tags
    rename_table :forgecms_tag_links, :forge_tag_links
    rename_table :forgecms_users, :forge_users
  end
end
