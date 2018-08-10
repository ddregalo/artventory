class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def create
    @artwork = artworks.create(artwork_params)
    redirect_to artworks_path
  end
end
