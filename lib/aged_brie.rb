require 'item'

class AgedBrie < Item

  def update_quality
    @quality += 1
  end
end
