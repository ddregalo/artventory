# frozen_string_literal: true

class AddUidToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :uid, :string
  end
end
