class Artwork < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :title, type: :text, analyzer: :english
      indexes :year, type: :date
      indexes :medium, type: :text, analyzer: :english
      indexes :price, type: :float
      indexes :description, type: :text, analyzer: :english
      indexes :collection, type: :text, analyzer: :english
      indexes :location, type: :text, analyzer: :english
      indexes :height, type: :integer
      indexes :width, type: :integer
      indexes :depth, type: :integer
      indexes :sold, type: :boolean
      indexes :created_at, type: :date
      indexes :updated_at, type: :date
    end
  end

  def self.search_all(query)
    self.search({
      query: {
        match_all: {}
      }
    })
  end
end
