require 'conjured'

describe Conjured do
  describe '#update_quality' do
    it 'reduces sell_in date by 1' do
      conjured = Conjured.new('Conjured Mana Cake', 10, 10)
      conjured.update_quality
      expect(conjured.sell_in).to eq 9
    end
  end
end
