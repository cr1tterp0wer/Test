class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :blog_entry

      t.timestamps
    end
    add_index :comments, :blog_entry_id
  end
end
