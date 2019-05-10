require File.join(File.dirname(__FILE__), 'item')

class Regular < Item

  def update_quality
    @sell_in -= 1
    @quality -= 1 if @quality > 0
    @quality -= 1 if @sell_in < 0 && @quality > 0
  end

end
