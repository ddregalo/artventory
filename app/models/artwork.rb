class Artwork < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :title, type: :text, analyzer: :english
      indexes :year, type: :date
      indexes :medium, type: :text, analyzer: :english
      indexes :price, type: :number
      indexes :description, :text, analyzer: :english
      indexes :collection, type: :text, analyzer: :english
      indexes :location, type: :text, analyzer: :english
      indexes :height, type: :number
      indexes :width, type: :number
      indexes :depth, type: :number
      indexes :sold, type: :boolean
#     indexes :notes, type: :text, analyzer: :english
      indexes :created_at, type: :date
      indexes :updated_at, type: :date
    end
  end
end
