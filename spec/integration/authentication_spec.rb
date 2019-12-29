require 'rails_helper'
require 'json'

describe 'POST /api/login', type: :request do
  let(:user) { create(:api_user) }
  let(:url) { '/api/login' }
  let(:params) { {"api_user": {"email": user.email, "password": user.password}}.to_json }
  let(:headers) { {'Content-Type': 'application/json'} }

  context 'when params are correct' do
    before do
      post url, :params => params, :headers => headers
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns JWT token in authorization header' do
      expect(response.headers['Authorization']).to be_present
    end
  end

  context 'when login params are incorrect' do
    it 'returns unathorized status' do
      post url
      expect(response.status).to eq 401
    end
  end
end

describe 'DELETE /logout', type: :request do
  let(:url) { '/api/logout' }

  it 'returns 204, no content' do
    delete url
    expect(response).to have_http_status(204)
  end
end