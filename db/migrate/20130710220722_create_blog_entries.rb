class CreateBlogEntries < ActiveRecord::Migration
  def change
    create_table :blog_entries do |t|
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
