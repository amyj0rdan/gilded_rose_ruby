require 'item'

describe Item do
  describe '#to_s' do
    it 'returns the name, sell_in and quality in a string' do
      item = Item.new('foo', 0, 0)
      expect(item.to_s).to eq 'foo, 0, 0'
    end
  end
end
