class AddDashifyTitleToBlogEntries < ActiveRecord::Migration
  def change
    add_column :blog_entries, :dashify_title, :boolean
  end
end
