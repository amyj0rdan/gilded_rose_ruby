require 'regular'

describe Regular do
  describe '#update_quality' do
    it 'decreases sell_in by 1' do
      regular = Regular.new('foo', 10, 10)
      regular.update_quality
      expect(regular.sell_in).to eq 9
    end

    it 'decreases quality of item by 1' do
      regular = Regular.new('foo', 10, 10)
      regular.update_quality
      expect(regular.quality).to eq 9
    end

    it 'does not decrease quality of an item below 0' do
      regular = Regular.new('foo', 0, 0)
      regular.update_quality
      expect(regular.quality).to eq 0
    end
  end
end
