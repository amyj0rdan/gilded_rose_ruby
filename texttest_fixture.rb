#!/usr/bin/ruby -w

require File.join(File.dirname(__FILE__), 'lib', 'gilded_rose')
require File.join(File.dirname(__FILE__), 'lib', 'item')
require File.join(File.dirname(__FILE__), 'lib', 'regular')
require File.join(File.dirname(__FILE__), 'lib', 'aged_brie')
require File.join(File.dirname(__FILE__), 'lib', 'backstage_passes')
require File.join(File.dirname(__FILE__), 'lib', 'sulfuras')
require File.join(File.dirname(__FILE__), 'lib', 'conjured')

puts 'OMGHAI!'
items = [
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

days = 2
days = ARGV[0].to_i + 1 unless ARGV.empty?

gilded_rose = GildedRose.new items
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts 'name, sellIn, quality'
  items.each do |item|
    puts item
  end
  puts ''
  gilded_rose.update_quality
end
