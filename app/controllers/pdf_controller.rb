class PdfController < ApplicationController
  include PdfHelper
  def new
    @artworks = Artwork.where(uid: current_user.uid)
  end

  def generate_pdf
    filename = current_user.username + Time.new.to_s + ".pdf"
    Prawn::Document.generate(filename) do |pdf|
      portfolio(pdf)
    end
    redirect_to artworks_path
  end

  private
  def pdf_params
    params.permit(:ids)
  end
end

