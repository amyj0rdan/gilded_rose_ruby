require 'sulfuras'

describe Sulfuras do
  describe '#update_quality' do
    it 'reduces sell_in by 1' do
      sulfuras = Sulfuras.new('Sulfuras, Hand of Ragnaros', 10, 10)
      sulfuras.update_quality
      expect(sulfuras.sell_in).to eq 9
    end

    it 'never decreases in quality' do
      sulfuras = Sulfuras.new('Sulfuras, Hand of Ragnaros', 10, 10)
      sulfuras.update_quality
      expect(sulfuras.quality).to eq 10
    end

    it 'never has a negative sell_in' do
      sulfuras = Sulfuras.new('Sulfuras, Hand of Ragnaros', 0, 10)
      sulfuras.update_quality
      expect(sulfuras.sell_in).to eq 0
    end
  end
end
