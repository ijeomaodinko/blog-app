require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Theresa',
      photo: 'https://github.com/Theresa/Blog-app',
      bio: 'Perfect gaze',
      posts_counter: 1
    )
    @post = Post.create(
      author_id: @user.id
    )

    @like = Like.create(
      author_id: @user.id,
      post_id: 1
    )
  end

  it 'like is valid as shown' do
    expect(@like).to be_valid
  end

  it 'likes must not have author' do
    @like.author_id = nil
    expect(@like).to_not be_valid
  end
end
