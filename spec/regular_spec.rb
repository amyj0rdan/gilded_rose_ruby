require 'regular'

describe Regular do
  describe '#update_quality' do
    it 'decreases sell_in by 1' do
      regular = Regular.new('foo', 10, 10)
      regular.update_quality
      expect(regular.sell_in).to eq 9
    end

    it 'decreases quality of item by 1 when sell_in is above 0' do
      regular = Regular.new('foo', 10, 10)
      regular.update_quality
      expect(regular.quality).to eq 9
    end

    it 'does not decrease quality of an item below 0' do
      regular = Regular.new('foo', 0, 0)
      regular.update_quality
      expect(regular.quality).to eq 0
    end

    it 'does not decrease quality of an item below 0' do
      regular = Regular.new('foo', 1, 1)
      regular.update_quality
      expect(regular.quality).to eq 0
    end

    it 'reduces sell_in below 0' do
      regular = Regular.new('foo', 0, 0)
      regular.update_quality
      expect(regular.sell_in).to eq(-1)
    end

    it 'decreases quality of an item by 2 when sell_in is below 0' do
      regular = Regular.new('foo', 0, 10)
      regular.update_quality
      expect(regular.quality).to eq 8
    end
  end
end
