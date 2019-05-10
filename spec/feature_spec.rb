require 'aged_brie'
require 'backstage_passes'
require 'conjured'
require 'gilded_rose'
require 'item'
require 'regular'
require 'sulfuras'

describe "Feature test" do
  before(:each) do
    @items = [
      Regular.new(name = '+5 Dexterity Vest', sell_in = 10, quality = 20),
      AgedBrie.new(name = 'Aged Brie', sell_in = 2, quality = 0),
      Regular.new(name = 'Elixir of the Mongoose', sell_in = 5, quality = 7),
      Sulfuras.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = 0, quality = 80),
      Sulfuras.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = -1, quality = 80),
      BackstagePasses.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 15, quality = 20),
      BackstagePasses.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 49),
      BackstagePasses.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 5, quality = 49),
      Conjured.new(name = 'Conjured Mana Cake', sell_in = 3, quality = 6)
    ]
  end

  describe '#update_quality' do
    it 'updates the quality of all items' do
      GildedRose.new(@items).update_quality
      expect(@items[0].quality).to eq 19
      expect(@items[1].quality).to eq 1
      expect(@items[2].quality).to eq 6
      expect(@items[3].quality).to eq 80
      expect(@items[4].quality).to eq 80
      expect(@items[5].quality).to eq 21
      expect(@items[6].quality).to eq 50
      expect(@items[7].quality).to eq 50
      expect(@items[8].quality).to eq 4
    end
  end

end
