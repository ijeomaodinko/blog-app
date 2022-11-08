require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  describe 'index' do 
    before(:each) do
      @user6 = User.create(id: 6, name: 'Tom', photo: 'https://images.pexels.com/photos/1382732/pexels-photo-1382732.jpeg?auto=compress&cs=tinysrgb&w=400',
       bio: 'Teacher from Mexico')
      @user5 = User.create(id: 5, name: 'Teres', photo: 'https://api.time.com/wp-content/uploads/2019/08/better-smartphone-photos',
      bio: 'Teacher from Mexico')
    visit '/users'
    end
  it 'I can see the username of all other users' do
    expect(page).to have_content (@user6.name)
    expect(page).to have_content (@user5.name)
  end
 
  end
end
