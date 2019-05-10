require 'item'

class BackstagePasses < Item
  def update_quality
    @sell_in -= 1
    @quality += 1
  end
end
