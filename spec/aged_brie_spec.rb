require 'aged_brie'

describe AgedBrie do

  describe '#update_quality' do
    it 'reduces sell_in by 1' do
      aged_brie = AgedBrie.new('Aged Brie', 10, 10)
      aged_brie.update_quality
      expect(aged_brie.sell_in).to eq 9
    end

    it 'increases in quality as it gets older' do
      aged_brie = AgedBrie.new('Aged Brie', 10, 10)
      aged_brie.update_quality
      expect(aged_brie.quality).to eq 11
    end

    it 'can reduce sell_in below 0' do
      aged_brie = AgedBrie.new('Aged Brie', 0, 10)
      aged_brie.update_quality
      expect(aged_brie.sell_in).to eq(-1)
    end

    it "doesn't have a quality higher than 50, when initial quality is 50" do
      aged_brie = AgedBrie.new('Aged Brie', 10, 50)
      aged_brie.update_quality
      expect(aged_brie.quality).to eq 50
    end

    it "doesn't have a quality higher than 50, when initial quality is > 50" do
      aged_brie = AgedBrie.new('Aged Brie', 10, 49)
      aged_brie.update_quality
      aged_brie.update_quality
      expect(aged_brie.quality).to eq 50
    end

    it 'quality increases twice as fast after sell_in date passed' do
      aged_brie = AgedBrie.new('Aged Brie', 0, 10)
      aged_brie.update_quality
      expect(aged_brie.quality).to eq 12
    end
  end
end
