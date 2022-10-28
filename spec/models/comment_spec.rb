require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Theresa',
      photo: 'https://github.com/trickphotos/Blog-app',
      bio: 'Perfect gaze',
      posts_counter: 1
    )
    @comment = Comment.create(
      text: 'Art is beauty',
      author_id: @user.id,
      post_id: 1
    )
  end

  it 'comments is valid as shown' do
    expect(@comment).to be_valid
  end

  it 'likes_counter must be an integer greater_than_or_equal_to 0' do
    @comment.text = 'hi'
    expect(@comment).to be_valid
  end
end
