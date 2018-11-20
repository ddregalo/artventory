# frozen_string_literal: true

class Artwork < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :title, type: :text, analyzer: :english
      indexes :year, type: :integer
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

  def self.search_artworks_main(query, uid)
    search(
      "query": {
        "bool": {
          "filter": {
            "term": {
              "uid": uid
            }
          },
          "must": {
            "multi_match": {
              "query": query,
              "fields": %w[
                title
                medium
                description
                collection
                location
              ]
            }
          }
        }
      }
    )
  end

  def self.search_artworks_sold(query, sold, uid)
    search(
      "query": {
        "bool": {
          "filter": {
            "bool": {
              "must": [
                { "term": { "uid": uid } },
                { "term": { "sold": sold } }
              ]
            }
          },
          "must": {
            "multi_match": {
              "query": query,
              "fields": %w[
                title
                medium
                description
                collection
                location
              ]
            }
          }
        }
      }
    )
  end
end
