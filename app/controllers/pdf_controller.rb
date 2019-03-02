class PdfController < ApplicationController
  def new
    @artworks = Artwork.where(uid: current_user.uid)
  end

  def generate_pdf
    Prawn::Document.generate(current_user.username + Time.new.to_s + ".pdf") do |pdf|
      pdf.formatted_text [ { :text => "A portfolio example\n\n", :size => 20} ]
      artworks = Artwork.where(uid: current_user.uid)
      
      artworks.each do |artwork|
        pdf.bounding_box([50, pdf.cursor], :width => 400, :height => 350) do
          pdf.stroke_bounds
          pdf.formatted_text [ { :text => "Title: " + artwork.title, :size => 16 } ]
          pdf.formatted_text [ { :text => "Medium: " + artwork.medium, :size => 12 } ]
          pdf.formatted_text [ { :text => "Desc: " + artwork.description, :size => 12 } ]
          pdf.image "#{Rails.root}/public" + artwork.image.url, :width => 300, :position => :right
         end
        title_position = pdf.cursor
      end
    end
    redirect_to artworks_path
  end
end
