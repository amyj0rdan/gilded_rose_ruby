require 'conjured'

describe Conjured do
  describe '#update_quality' do
    it 'reduces sell_in date by 1' do
      conjured = Conjured.new('Conjured Mana Cake', 10, 10)
      conjured.update_quality
      expect(conjured.sell_in).to eq 9
    end

    it 'reduces sell_in below 0' do
      conjured = Conjured.new('Conjured Mana Cake', 0, 10)
      conjured.update_quality
      expect(conjured.sell_in).to eq(-1)
    end

    it 'decreases quality by 2' do
      conjured = Conjured.new('Conjured Mana Cake', 10, 10)
      conjured.update_quality
      expect(conjured.quality).to eq 8
    end

    it 'does not reduce the quality below 0' do
      conjured = Conjured.new('Conjured Mana Cake', 10, 0)
      conjured.update_quality
      expect(conjured.quality).to eq 0
    end

    it 'reduces quality twice as fast after sell_in date passed' do
      conjured = Conjured.new('Conjured Mana Cake', 0, 10)
      conjured.update_quality
      expect(conjured.quality).to eq(6)
    end
  end
end
