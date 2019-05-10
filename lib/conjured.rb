require 'item'

class Conjured < Item
  def update_quality
    @sell_in -= 1
    @quality -= 2 if @quality > 0
  end
end
