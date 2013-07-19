class AddMashifyTitleToBlogEntries < ActiveRecord::Migration
  def change
    add_column :blog_entries, :mashify_title, :boolean
  end
end
