require 'item'

class Conjured < Item
  def update_quality
    @sell_in -= 1
  end
end
