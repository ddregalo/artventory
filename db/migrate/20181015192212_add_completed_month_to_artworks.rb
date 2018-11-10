class AddCompletedMonthToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :completed_month, :integer
  end
end
