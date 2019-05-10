require File.join(File.dirname(__FILE__), 'item')

class AgedBrie < Item

  def update_quality
    @sell_in -= 1
    @quality += 1 if @quality < 50 && @sell_in >= 0
    @quality += 2 if @quality < 50 && @sell_in < 0
  end
end
