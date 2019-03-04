class PdfController < ApplicationController
  require 'pdf/templates/portfolio_templates.rb'
  include PortfolioTemplates

  def new
    @artworks = Artwork.where(uid: current_user.uid)
  end

  def generate_pdf
    filename = current_user.username + Time.new.to_s + ".pdf"
    filepath = "" + filename
    Prawn::Document.generate(filepath) do |pdf|
      portfolio_design1(pdf)
    end
    redirect_to artworks_path
    UserMailer.with(user: current_user, filename: filename, filepath: filepath).portfolio_email.deliver_later

  end

  private
  def pdf_params
    params.permit(:ids)
  end
end

