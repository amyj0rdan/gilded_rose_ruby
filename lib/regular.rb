class Regular < Item

  def update_quality
    @sell_in -= 1
    @quality -= 1 unless @quality < 1
    @quality -= 1 if @sell_in < 0 && @quality > 1
  end

end
