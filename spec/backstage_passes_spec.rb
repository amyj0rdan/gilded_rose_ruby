require 'backstage_passes'

describe BackstagePasses do
  describe '#update_quality' do
    it 'increases in quality as the sell_in approaches' do
      backstage_passes = BackstagePasses.new('Backstage passes to a TAFKAL80ETC concert', 20, 20)
      backstage_passes.update_quality
      expect(backstage_passes.quality).to eq 21
    end

    it 'updates sell_in date' do
      backstage_passes = BackstagePasses.new('Backstage passes to a TAFKAL80ETC concert', 20, 20)
      backstage_passes.update_quality
      expect(backstage_passes.sell_in).to eq 19
    end
  end
end
