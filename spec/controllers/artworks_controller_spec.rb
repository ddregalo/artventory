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

  describe 'GET #artworks/new' do
    it 'returns http sucess status of 200 or ok' do
      get :new
      expect(response).to have_http_status(:ok)
    end

    it 'renders the new view' do
      get :new
      expect(response).to render_template('artworks/new')
    end
  end

  describe 'POST new artwork' do
    it 'creates a new artwork' do
      post :create, params: { artwork:
        {
          title: 'Test Artwork 1',
          year: 1984,
          medium: 'Acrylic',
          price: 1500.00,
          description: 'Testing 1-2',
          collection: 'Test Collection',
          location: 'London',
          height: 10,
          width: 10,
          depth: 3,
          sold: true
        }}
      expect(Artwork.all.count).to eq(1)
    end
  end

  describe 'POST delete post' do
    it 'deletes a post' do
      post :create, params: { artwork:
        {
          title: 'Test Artwork 1',
          year: 1984,
          medium: 'Acrylic',
          price: 1500.00,
          description: 'Testing 1-2',
          collection: 'Test Collection',
          location: 'London',
          height: 10,
          width: 10,
          depth: 3,
          sold: true
        }}
      post :delete, params: { uid: Artwork.last.id }
      expect(Artwork.all.count).to eq(0)
    end
  end
end
