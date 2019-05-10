class Regular < Item

  def update_quality
    @sell_in -= 1
    @quality -= 1 if @sell_in > 0
  end

end
