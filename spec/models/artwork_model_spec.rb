# frozen_string_literal: true

RSpec.describe Artwork, elasticsearch: true, type: :model do
  it 'artwork should be indexed search by title' do
    Artwork.create(
      title: 'Artwork 1'
    )

    # refresh the index
    Artwork.__elasticsearch__.refresh_index!

    # verify your model was indexed
    expect(Artwork.search('Artwork 1').records.length).to eq(1)
  end

  it 'artwork should be indexed search by description' do
    Artwork.create(
      title: 'Artwork 1',
      description: 'Artwork 1 description'
    )

    # refresh the index
    Artwork.__elasticsearch__.refresh_index!

    # verify your model was indexed
    expect(Artwork.search('Artwork 1 description').records.length).to eq(1)
  end
end
