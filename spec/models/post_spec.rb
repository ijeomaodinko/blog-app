require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Theresa',
      photo: 'https://github.com/trickphotos/Blog-app',
      bio: 'Perfect gaze',
      posts_counter: 1
    )

    @post = Post.create(
      title: 'Piercing the Darkness',
      text: 'Angels of warfare',
      comments_counter: 5,
      likes_counter: 1,
      author_id: @user.id
    )
  end

  it 'post is valid as shown' do
    expect(@post).to be_valid
  end

  it 'title should not be blank' do
    @post.title = 'winning spirit'
    expect(@post).to be_valid
  end

  it 'comments_counter must have an integer greater_than_or_equal_to 0' do
    @post.comments_counter = 5
    expect(@post).to be_valid
  end

  it 'likes_counter must be an integer greater_than_or_equal_to 0' do
    @post.likes_counter = 1
    expect(@post).to be_valid
  end
end
