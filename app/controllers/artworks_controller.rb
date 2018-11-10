# frozen_string_literal: true

class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.where(uid: current_user.uid)
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.create(artwork_params)
                      .update(uid: current_user.uid)
    redirect_to artworks_path
  end

  def edit
    @artwork = Artwork.find(params[:uid])
    if @artwork.uid == current_user.uid
      return @artwork
    else
      raise 'Unauthorized user access'
    end
  end

  def update
    @artwork = Artwork.find(params[:id])
    @artwork.update(
      title: params[:title],
      year: params[:year],
      medium: params[:medium],
      price: params[:price],
      description: params[:description],
      collection: params[:collection],
      location: params[:location],
      height: params[:height],
      width: params[:width],
      depth: params[:depth],
      sold: params[:sold],
      notes: params[:notes],
      completed_month: params[:completed_month]
    )
    redirect_to artworks_path
  end

  def delete
    @artwork = Artwork.find(params[:uid])
    if @artwork.uid == current_user.uid
      @artwork.destroy
      redirect_to artworks_path
    else
      raise 'Unauthorized Action'
    end
  end

  def search
    query = params[:search_artworks].presence && params[:search_artworks][:query]
    option = params[:search_artworks].presence && params[:search_artworks][:option]
    if query && option
      case option
      when 'all'
        @artworks = Artwork.search_artworks_main(query, current_user.uid)
      when 'sold'
        @artworks = Artwork.search_artworks_sold(query, true, current_user.uid)
      when 'unsold'
        @artworks = Artwork.search_artworks_sold(query, false, current_user.uid)
      end
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :year, :medium, :price, :description, :collection, :location, :height, :width, :depth, :sold, :notes, :completed_month)
  end
end
