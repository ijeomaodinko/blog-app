class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def update_like_counter
    post.increment!(:like_counter)
  end
 
end
