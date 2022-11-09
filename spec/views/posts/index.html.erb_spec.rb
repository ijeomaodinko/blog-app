require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :feature do
  describe 'index' do
    before(:example) do
      @user1 = User.create(name: 'Moon', photo: 'https://images.pexels.com/photos/1805164/pexels-photo-1805164.jpeg?auto=compress&cs=tinysrgb&w=400',
                           bio: 'FullStack Developer from Porland.')

      @post1 = Post.create(author_id: @user1.id, title: 'Greating', text: 'Hello everyone is awesome day for all',
                           comments_counter: 1, likes_counter: 0)

      @comment = Comment.create(post_id: @post1.id, author_id: @user1.id, text: 'Hi, Excellence')

      @like1 = Like.create(user_id: 1, post_id: 1)

      visit user_posts_path(@user1)
    end

    # it 'should show user profile' do
    #   expect(page.find('img')['src']).to have_content('https://images.pexels.com/photos/1382732/pexels-photo-1382732.jpeg?auto=compress&cs=tinysrgb&w=400')
    # end

    it 'should show user user name' do
      expect(page).to have_content('Moon')
    end

    it 'should show the number of posts the user has written.' do
      expect(page).to have_content(2)
    end
    it 'should show the post title' do
      expect(page).to have_content('Greating')
    end
    it 'should show the post body' do
      expect(page).to have_content('Hello everyone is awesome day for all')
    end
    it 'should show first comment on a post' do
      expect(page).to have_content(@post1.text)
    end
    # it 'should show number of comments' do
    #   expect(page).to have_content('comments: 1')
    # end

    it 'should show number of likes' do
      expect(page).to have_content('Likes: 0')
    end

    # it 'redirects to the posts show page when a post is clicked' do
    #   click_on 'Greatings'
    #   expect(page).to have_current_path user_post_path(@user1, @post1)
    # end

    it 'has a pagination button' do
      expect(page).to have_content('Pagination')
    end
  end
end
