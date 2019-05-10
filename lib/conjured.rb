require File.join(File.dirname(__FILE__), 'item')

class Conjured < Item
  def update_quality
    @sell_in -= 1
    @quality -= 2 if @sell_in >= 0 && @quality > 0
    @quality -= 4 if @sell_in <= 0 && @quality > 0
  end
end
