require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
  before(:each) do
  @user1 = User.create(name: 'Theresa', photo: 'https://images.pexels.com/photos/47547/squirrel-animal-cute-rodents-47547.jpeg?auto=compress&cs=tinysrgb&w=400',
  bio: 'FullStack Developer from Nigeria.', posts_counter: 2)
  @post1 = Post.create(
    author_id: @user1.id, 
    title: 'Greating', 
    text: 'Hello everyone is awesome day for all', 
    comments_counter: 3, 
    likes_counter: 0
  )
  @post2 = Post.create(
    author_id: @user1.id, 
    title: 'Building on ruby', 
    text: 'This is a all about ruby on rails', 
    comments_counter: 0, 
    likes_counter: 0
  )

visit user_path(@user1)

end

it 'It should show user photo' do
  expect(page.find('img')['src']).to have_content('https://images.pexels.com/photos/47547/squirrel-animal-cute-rodents-47547.jpeg?auto=compress&cs=tinysrgb&w=400')
end

it 'It should show user name' do
  expect(page).to have_content(@user1.name)
end

it 'It should show user name' do
  expect(page).to have_content(@user1.bio)
end

it 'It should show posts count' do
  expect(page).to have_content('Number of posts: 2')
end

it 'It should show last two posts' do
  expect(page).to have_content(@post1.id)
  expect(page).to have_content(@post2.id)
end

it 'It should show last three posts' do
  expect(page).to have_link('See all Post')
end

it 'when user post is clicked it should redirect to posts show' do
  click_link 'Building on ruby'
  expect(page).to have_current_path(user_post_path(@user1, @post2))
end
end
