require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:all) do
      @address =  get '/post/index' 
    end

    it 'returns http success' do
      get '/post/index'
      expect(response).to have_http_status(:success)
    end

    it 'returns a valid status' do
      expect(@address).to eq(200)
    end
    it 'should render the actual template' do
      expect(get('/post/index')).to render_template('index')
    end

    it 'Response body should return correct placeholder text' do
      expect(response.body).to include 'Here is the list of all the post'
    end
  end

  describe 'GET /show' do
    before(:all) do
      @address = get '/post/show'
    end

    it 'returns a valid status' do
      expect(@address).to eq(200)
    end
    it 'should render the actual template' do
      expect(get('/post/show')).to render_template('show')
    end
    it 'returns http success' do
      get '/post/show'
      expect(response).to have_http_status(:success)
    end

    it 'matches the placeholder text with the response body' do
      expect(response.body).to include 'Here is the list of all the post'
    end
  end
end
