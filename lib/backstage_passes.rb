require 'item'

class BackstagePasses < Item
  def update_quality
    @sell_in -= 1
    @quality += 1
    @quality += 1 if @sell_in < 10
  end
end
