require 'gilded_rose'
require 'item'

describe GildedRose do
  describe '#update_quality' do
    it 'calls update_quality on the item' do
      items = [Item.new('foo', 0, 0)]
      expect(items[0]).to receive(:update_quality)
      GildedRose.new(items).update_quality
    end
  end
end
