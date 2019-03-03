module PdfHelper
    def portfolio(pdf)
        pdf.formatted_text [ { :text => "A portfolio example\n\n", :size => 20} ]
        artworks = Artwork.where(uid: current_user.uid)
        params[":ids"].each do |id|
          artwork = artworks.find(id)
          pdf.bounding_box([50, pdf.cursor], :width => 400, :height => 350) do
            pdf.stroke_bounds
            pdf.formatted_text [ { :text => "Title: " + artwork.title, :size => 16 } ]
            pdf.formatted_text [ { :text => "Medium: " + artwork.medium, :size => 12 } ]
            pdf.formatted_text [ { :text => "Desc: " + artwork.description, :size => 12 } ]
            pdf.image "#{Rails.root}/public" + artwork.image.url, :width => 50, :position => :right
          end
        end
    end
end
