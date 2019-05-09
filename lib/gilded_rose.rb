class GildedRose

  INCREASE_QUALITY_ITEMS = ['Aged Brie', 'Backstage passes']

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if INCREASE_QUALITY_ITEMS.all? { |type| !item.name.include?(type) }
        decrease_quality(item)
      else
        increase_quality(item)
      end
      decrease_sell_in(item)
      if item.sell_in < 0
        if !item.name.include?('Aged Brie')
          decrease_quality(item)
        else
          increase_quality(item)
        end
      end
    end
  end

  private

  def decrease_quality(item)
    if item.quality > 0
      item.quality -= 1 unless item.name.include?('Sulfuras')
      item.quality -= 1 if item.name.include?('Conjured')
      item.quality = 0 if item.name.include?('Backstage passes')
    end
  end

  def increase_quality(item)
    if item.quality < 50
      item.quality += 1
      if item.quality < 49 && item.name.include?('Backstage passes')
        item.quality += 1 if item.sell_in.between?(6, 10)
        item.quality += 2 if item.sell_in.between?(0, 5)
      end
    end
  end

  def decrease_sell_in(item)
    item.sell_in -= 1 unless item.name.include?('Sulfuras')
  end
end
