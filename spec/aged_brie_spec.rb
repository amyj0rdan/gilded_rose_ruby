require 'aged_brie'

describe AgedBrie do

  describe '#update_quality' do
    it 'reduces sell in by 1' do
      aged_brie = AgedBrie.new('Aged Brie', 10, 10)
      aged_brie.update_quality
      expect(aged_brie.sell_in).to eq 9
    end

    it 'increases in quality as it gets older' do
      aged_brie = AgedBrie.new('Aged Brie', 10, 10)
      aged_brie.update_quality
      expect(aged_brie.quality).to eq 11
    end
  end

end
