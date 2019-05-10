require 'aged_brie'

describe AgedBrie do
  it 'increases in quality as it gets older' do
    aged_brie = AgedBrie.new('Aged Brie', 10, 10)
    aged_brie.update_quality
    expect(aged_brie.quality).to eq 11
  end

end
