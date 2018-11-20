# frozen_string_literal: true

class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title
      t.integer :year
      t.string :medium
      t.integer :price
      t.text :description
      t.string :collection
      t.string :location
      t.integer :height
      t.integer :width
      t.integer :depth
      t.boolean :sold
      t.text :notes

      t.timestamps
    end
  end
end
