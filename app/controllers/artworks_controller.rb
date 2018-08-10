class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.create(artwork_params)
    redirect_to artworks_path
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title,:price,:sold)
  end
end
