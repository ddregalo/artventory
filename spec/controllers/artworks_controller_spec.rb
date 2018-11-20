# frozen_string_literal: true

RSpec.describe ArtworksController, type: :controller do
  before(:each) do
    @user = User.create!(
      email: 'user@test.com',
      password: 'password',
      password_confirmation: 'password'
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
        } }
      expect(Artwork.all.count).to eq(1)
      expect(Artwork.all.first.title).to eq('Test Artwork 1')
      expect(Artwork.all.first.year).to eq(1984)
      expect(Artwork.all.first.medium).to eq('Acrylic')
      expect(Artwork.all.first.price).to eq(1500.00)
      expect(Artwork.all.first.description).to eq('Testing 1-2')
      expect(Artwork.all.first.collection).to eq('Test Collection')
      expect(Artwork.all.first.location).to eq('London')
      expect(Artwork.all.first.height).to eq(10)
      expect(Artwork.all.first.width).to eq(10)
      expect(Artwork.all.first.depth).to eq(3)
      expect(Artwork.all.first.sold).to eq(true)
    end
  end

  describe 'POST delete artwork' do
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
        } }
      post :delete, params: { uid: Artwork.last.id }
      expect(Artwork.all.count).to eq(0)
    end
  end

  describe 'PUT edit artwork' do
    let(:updated_artwork) do
      {
        title: 'Updated Artwork 1',
        year: 1983,
        medium: 'Oil',
        price: 100.00,
        description: 'Updated 1-2',
        collection: 'Updated Collection',
        location: 'London Update',
        height: 20,
        width: 20,
        depth: 5,
        sold: false
      }
    end

    it 'PUT edits an artwork' do
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
        } }
      put :edit, params: { uid: Artwork.last.id, artwork: :updated_artwork }
      artwork = Artwork.last
      artwork.reload
      updated_artwork.each do |key|
        expect(artwork.attributes[key.to_s]).to eq(updated_artwork[key])
      end
    end
  end
end
