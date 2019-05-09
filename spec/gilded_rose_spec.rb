require 'gilded_rose'
require 'item'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
  end

  describe "#update_quality for a regular item" do
    it "reduces the sell_in value by 1" do
      items = [Item.new("foo", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it "reduces the quality by 1" do
      items = [Item.new("foo", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 9
    end

    it "does not reduce quality below 0" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "reduces sell_in below 0" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
    end

    it "reduces quality twice as fast after sell_in date passed" do
      items = [Item.new("foo", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 8
    end

  end

end