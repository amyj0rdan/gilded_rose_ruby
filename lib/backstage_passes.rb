require 'item'

class BackstagePasses < Item
  def update_quality
    @quality += 1
  end
end
