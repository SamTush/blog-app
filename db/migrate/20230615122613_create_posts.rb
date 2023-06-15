class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: { to_table: :users }
      t.string :title
      t.text :text

      t.timestamps
    end
    add_index :posts, :author_id
  end
end
