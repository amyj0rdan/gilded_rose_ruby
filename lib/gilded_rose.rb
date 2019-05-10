require_relative 'aged_brie'
require_relative 'backstage_passes'
require_relative 'conjured'
require_relative 'regular'
require_relative 'sulfuras'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.update_quality
    end
  end

end
