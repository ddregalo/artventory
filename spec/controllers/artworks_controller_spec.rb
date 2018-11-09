# frozen_string_literal: true

RSpec.describe ArtworksController, type: :controller do
  before(:each) do
    @user = User.create!(
      {
        email: 'user@test.com',
        password: 'password',
        password_confirmation: 'password'
      }
    )
    sign_in @user
  end

  describe 'GET #artworks/index' do
    it 'returns http success status of 200 or ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index view' do
      get :index
      expect(response).to render_template('artworks/index')
    end
  end
end
