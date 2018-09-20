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
      year: params[:year],
      medium: params[:medium],
      price: params[:price],
      description: params[:description],
      collection: params[:collectionlocation],
      location: params[:location],
      height: params[:height],
      width: params[:width],
      depth: params[:depth],
      sold: params[:sold],
    )
    redirect_to artworks_path
  end

  def delete
    @artwork = Artwork.find(params[:format])
    @artwork.destroy
    redirect_to artworks_path
  end

  def search
    query = params[:search_artworks].presence && params[:search_artworks][:query]
  
    if query
      @artworks = Artwork.search_artworks_main(query)
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :year, :medium, :price, :description, :collection, :location, :height, :width, :depth, :sold)
  end
end
