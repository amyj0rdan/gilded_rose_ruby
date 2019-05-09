require 'gilded_rose'
require 'item'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end
  end

  describe '#update_quality for a regular item' do
    it 'reduces the sell_in value by 1' do
      items = [Item.new('foo', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 9
    end

    it 'reduces the quality by 1' do
      items = [Item.new('foo', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 9
    end

    it 'does not reduce quality below 0' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it 'reduces sell_in below 0' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq(-1)
    end

    it 'reduces quality twice as fast after sell_in date passed' do
      items = [Item.new('foo', 0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 8
    end
  end

  describe '#update_quality for Aged Brie' do
    it 'increases in quality as it gets older' do
      items = [Item.new('Aged Brie', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 11
    end

    it "doesn't ever have quality higher than 50" do
      items = [Item.new('Aged Brie', 10, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
    end

    it 'quality increases twice as fast passed sell in date' do
      items = [Item.new('Aged Brie', 0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 12
    end
  end

  describe "#update_quality for 'Sulfuras'" do
    it 'never decreases in quality' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 10
    end

    it 'never had a negative sell in date' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end
  end

  describe "#update_quality for 'Backstage passes'" do
    it 'increases in quality as a the sell in value approaches' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 20, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 21
    end

    it 'increases in quality by 2 when there are 10 days or less to sell in' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 12
    end

    it 'increases in quality by 3 when there are 5 days or less to sell in' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 13
    end

    it 'drops quality to 0 after the concert' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it 'does not increase quality above 50' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
    end

    it 'does not increase quality above 50, when quality starts below 50' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 49)]
      GildedRose.new(items).update_quality
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
    end
  end

  describe "#update_quality for 'Conjured Mana Cake'" do
    it 'decreases quality twice as fast as regular items' do
      items = [Item.new('Conjured Mana Cake', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 8
    end
  end
end
