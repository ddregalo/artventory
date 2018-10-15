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
      indexes :uid, type: :text
    end
  end

  def self.search_artworks_main(query)
    self.search({
      "query": {
        "multi_match": {
          "query":    query, 
          "fields": [ 
            "title",
            "medium",
            "description",
            "collection",
            "location"
          ]
        }
      }
    })
  end

  def self.search_artworks_sold(query, sold)
    self.search({
      "query": {
        "bool": {
          "filter": {
            "term": {
              "sold": sold
            }
          },
          "must": {
            "multi_match": {
              "query":    query, 
              "fields": [ 
                "title",
                "medium",
                "description",
                "collection",
                "location"
              ]
            }
          }
        }
      }
    })
  end
   
  


end
