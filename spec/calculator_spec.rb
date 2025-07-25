require 'calculator'

RSpec.describe Calculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(described_class.add("")).to eq(0)
    end

    context 'when there is only one number' do
      it 'returns the same number which is passed' do
        expect(described_class.add("1")).to eq(1)
      end
    end

    context 'when there is 2 number passed as argument' do
      context 'when one number is 0' do
        it 'should return 0 as result' do
          expect(described_class.add("1,0")).to eq(1)
        end
      end

      context 'when both the numbers are 0' do
        it 'should return 0 as result' do
          expect(described_class.add("0,0")).to eq(0)
        end
      end

      context 'when both the numbers are non zero' do
        it 'should return the sum of 2 numbers' do
          expect(described_class.add("1,5")).to eq(6)
        end
      end
    end
  end
end
