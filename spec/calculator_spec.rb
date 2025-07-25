require 'calculator'

RSpec.describe Calculator do
  describe '.add' do
    context 'when delimeter is ,' do
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

      context 'when there are more then 2 numbers' do
        context 'when there are 3 numbers' do
          context 'all numbers are non zero' do
            it 'should return sum of all 3 numbers' do
              expect(described_class.add("1,2,3")).to eq(6)
            end
          end

          context '1 number is zero and rest are non zero' do
            it 'should return sum of all 3 numbers' do
              expect(described_class.add("1,0,3")).to eq(4)
            end
          end
        end

        context 'when there are 6 numbers' do
          context 'all numbers are non zero' do
            it 'should return sum of all 6 numbers' do
              expect(described_class.add("1,2,3,3,8,10")).to eq(27)
            end
          end

          context '1 number is zero and rest are non zero' do
            it 'should return sum of all 6 numbers' do
              expect(described_class.add("1,2,3,0,8,10")).to eq(24)
            end
          end
        end
      end
    end

    context 'when delimeter is \n' do
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
            expect(described_class.add("1\n0")).to eq(1)
          end
        end

        context 'when both the numbers are 0' do
          it 'should return 0 as result' do
            expect(described_class.add("0\n0")).to eq(0)
          end
        end

        context 'when both the numbers are non zero' do
          it 'should return the sum of 2 numbers' do
            expect(described_class.add("1\n5")).to eq(6)
          end
        end
      end

      context 'when there are more then 2 numbers' do
        context 'when there are 3 numbers' do
          context 'all numbers are non zero' do
            it 'should return sum of all 3 numbers' do
              expect(described_class.add("1\n2\n3")).to eq(6)
            end
          end

          context '1 number is zero and rest are non zero' do
            it 'should return sum of all 3 numbers' do
              expect(described_class.add("1n\0\n3")).to eq(4)
            end
          end
        end

        context 'when there are 6 numbers' do
          context 'all numbers are non zero' do
            it 'should return sum of all 6 numbers' do
              expect(described_class.add("1\n2\n3\n3\n8\n10")).to eq(27)
            end
          end

          context '1 number is zero and rest are non zero' do
            it 'should return sum of all 6 numbers' do
              expect(described_class.add("1\n2\n3\n0\n8\n10")).to eq(24)
            end
          end
        end
      end
    end

    context 'when delimeters are both \n and ,' do
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
            expect(described_class.add("1\n5")).to eq(6)
          end
        end
      end

      context 'when there are more then 2 numbers' do
        context 'when there are 3 numbers' do
          context 'all numbers are non zero' do
            it 'should return sum of all 3 numbers' do
              expect(described_class.add("1\n2,3")).to eq(6)
            end
          end

          context '1 number is zero and rest are non zero' do
            it 'should return sum of all 3 numbers' do
              expect(described_class.add("1,0\n3")).to eq(4)
            end
          end
        end

        context 'when there are 6 numbers' do
          context 'all numbers are non zero' do
            it 'should return sum of all 6 numbers' do
              expect(described_class.add("1,2\n3,3\n8\n10")).to eq(27)
            end
          end

          context '1 number is zero and rest are non zero' do
            it 'should return sum of all 6 numbers' do
              expect(described_class.add("1\n2\n3,0,8\n10")).to eq(24)
            end
          end
        end
      end
    end
  end
end
