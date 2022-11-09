require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
    before(:each) do
      @user1 = User.create(name: 'Moon', photo: 'https://images.pexels.com/photos/1805164/pexels-photo-1805164.jpeg?auto=compress&cs=tinysrgb&w=400',
       bio: 'FullStack Developer from Porland.', posts_counter: 2)
     
      @post1 = Post.create(
        author_id: @user1.id, 
        title: 'Greating', 
        text: 'Hello everyone is awesome day for all', 
        comments_counter: 1, 
        likes_counter: 0
      )

      (0..1).each do |id|
      @comment = Comment.create(
        post_id: @post1.id, 
        author_id: @user1.id, 
        text: 'Hi, Excellence' )
      end

      visit  user_posts_path(@user1)
end

  it 'should show post title' do
    expect(page).to have_content('Greating')
  end
  it 'should show the author of the post' do
    expect(page).to have_content('Moon')
  end
  it 'should show comment count' do
    expect(page).to have_content(@post1.comments_counter)
  end
  it 'should show likes count' do
    expect(page).to have_content(@post1.likes_counter)
  end
  it 'should show commentor name' do
    expect(page).to have_content('Moon')
  end
end
