require File.join(File.dirname(__FILE__), 'item')

class Sulfuras < Item

  def update_quality
    @sell_in -= 1 if @sell_in > 0
  end
end
