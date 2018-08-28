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

  def edit
    @artwork = Artwork.find(params[:format])
  end

  def update
    @artwork = Artwork.find(params[:id])
    @artwork.update(
      title: params[:title],
      price: params[:price],
      sold: params[:sold],
    )
    redirect_to artworks_path
  end

  def delete
    @artwork = Artwork.find(params[:format])
    @artwork.destroy
    redirect_to artworks_path
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title,:price,:sold)
  end
end
