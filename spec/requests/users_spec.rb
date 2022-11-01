require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) { get users_path }

    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'assigns all users to @users ' do
      expect(assigns(:users)).to eq(User.all)
    end

    it 'matches the placeholder text with the response body' do
      expect(response.body).to include 'Here is list of all the users'
    end
  end

  describe 'GET /show' do
    before(:each) { '/users/show' }

    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end

    it 'renders show template' do
      get :'/users/show'
      expect(response).to render_template('show')
    end
  end
end
