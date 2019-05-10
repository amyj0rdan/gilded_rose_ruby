require 'backstage_passes'

describe BackstagePasses do
  describe '#update_quality' do
    it 'increases in quality as the sell_in approaches' do
      backstage_passes = BackstagePasses.new('Backstage passes to a TAFKAL80ETC concert', 20, 20)
      backstage_passes.update_quality
      expect(backstage_passes.quality).to eq 21
    end

    it 'decreases sell_in date' do
      backstage_passes = BackstagePasses.new('Backstage passes to a TAFKAL80ETC concert', 20, 20)
      backstage_passes.update_quality
      expect(backstage_passes.sell_in).to eq 19
    end

    it 'increases in quality by 2 when there are 6 to 10 days to sell in' do
      backstage_passes = BackstagePasses.new('Backstage passes to a TAFKAL80ETC concert', 10, 20)
      backstage_passes.update_quality
      expect(backstage_passes.quality).to eq 22
    end
  end
end
