class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end

first_post = Post.create(author_id: 1, title: 'Hello', text: 'This is my first post')