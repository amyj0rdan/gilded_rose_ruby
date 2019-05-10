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
      Regular.new('+5 Dexterity Vest', 10, 20),
      AgedBrie.new('Aged Brie', 2, 0),
      Regular.new('Elixir of the Mongoose', 5, 7),
      Sulfuras.new('Sulfuras, Hand of Ragnaros', 0, 80),
      Sulfuras.new('Sulfuras, Hand of Ragnaros', -1, 80),
      BackstagePasses.new('Backstage passes to a TAFKAL80ETC concert', 15, 20),
      BackstagePasses.new('Backstage passes to a TAFKAL80ETC concert', 10, 49),
      BackstagePasses.new('Backstage passes to a TAFKAL80ETC concert', 5, 49),
      Conjured.new('Conjured Mana Cake', 3, 6)
    ]
  end

  describe '#update_quality' do
    it 'updates the quality of the relevant items' do
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

    it 'updates the sell_in date of the relevant items' do
      GildedRose.new(@items).update_quality
      expect(@items[0].sell_in).to eq 9
      expect(@items[1].sell_in).to eq 1
      expect(@items[2].sell_in).to eq 4
      expect(@items[3].sell_in).to eq 0
      expect(@items[4].sell_in).to eq(-1)
      expect(@items[5].sell_in).to eq 14
      expect(@items[6].sell_in).to eq 9
      expect(@items[7].sell_in).to eq 4
      expect(@items[8].sell_in).to eq 2
    end

    it 'updates the quality of the relevant items on second #update_quality' do
      gilded_rose = GildedRose.new(@items)
      gilded_rose.update_quality
      gilded_rose.update_quality
      expect(@items[0].quality).to eq 18
      expect(@items[1].quality).to eq 2
      expect(@items[2].quality).to eq 5
      expect(@items[3].quality).to eq 80
      expect(@items[4].quality).to eq 80
      expect(@items[5].quality).to eq 22
      expect(@items[6].quality).to eq 50
      expect(@items[7].quality).to eq 50
      expect(@items[8].quality).to eq 2
    end
  end

end
