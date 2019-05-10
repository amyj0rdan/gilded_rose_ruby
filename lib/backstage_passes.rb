require File.join(File.dirname(__FILE__), 'item')

class BackstagePasses < Item
  def update_quality
    @sell_in -= 1
    @quality += 1 if @sell_in > 10
    @quality += 2 if @sell_in.between?(6, 10)
    @quality += 3 if @sell_in.between?(0, 5)
    @quality = 0 if @sell_in <= 0
    @quality = 50 if @quality > 50
  end
end
