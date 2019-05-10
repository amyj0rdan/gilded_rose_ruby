require 'item'

class AgedBrie < Item

  def update_quality
    @sell_in -= 1
    @quality += 1 if @quality < 50
  end
end
