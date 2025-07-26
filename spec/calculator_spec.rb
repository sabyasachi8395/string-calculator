require 'calculator'

RSpec.describe Calculator do
  describe '.add' do
    context 'when delimiter is ,' do
      it 'returns 0 for an empty string' do
        expect(described_class.add("")).to eq(0)
      end

      context 'when there is only positive numbers' do
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

      context 'when there are both positive & negative numbers' do
        context 'when there is only one number' do
          it 'returns the same number which is passed' do
            expect(described_class.add("1")).to eq(1)
          end

          it 'raise error for the negative number' do
            expect { described_class.add("-1") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
          end
        end

        context 'when there is 2 number passed as argument' do
          context 'when one number is 0' do
            it 'should return 0 as result' do
              expect(described_class.add("1,0")).to eq(1)
            end

            it 'should raise error due to the negative number' do
              expect { described_class.add("-1,0") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
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

            it 'should raise error due to negative numbers' do
              expect { described_class.add("1,-5") }.to raise_error(RuntimeError, "negative numbers not allowed -5")
            end

            it 'should raise error due to negative numbers' do
              expect { described_class.add("-1,-5") }.to raise_error(RuntimeError, "negative numbers not allowed -1, -5")
            end
          end
        end

        context 'when there are more then 2 numbers' do
          context 'when there are 3 numbers' do
            context 'all numbers are non zero' do
              it 'should return sum of all 3 numbers' do
                expect(described_class.add("1,2,3")).to eq(6)
              end

              it 'should raise error due to negative number' do
                expect { described_class.add("-1,2,-3") }.to raise_error(RuntimeError, "negative numbers not allowed -1, -3")
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

              it 'should raise error due to negative numbers' do
                expect { described_class.add("1,2,-3,3,8,-10") }.to raise_error(RuntimeError, "negative numbers not allowed -3, -10")
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
    end

    context 'when delimiter is \n' do
      it 'returns 0 for an empty string' do
        expect(described_class.add("")).to eq(0)
      end

      context 'when there is only one number' do
        it 'returns the same number which is passed' do
          expect(described_class.add("1")).to eq(1)
        end

        it 'raise error if any negative number is passed' do
          expect { described_class.add("-1") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
        end
      end

      context 'when there is 2 number passed as argument' do
        context 'when one number is 0' do
          it 'should return 0 as result' do
            expect(described_class.add("1\n0")).to eq(1)
          end

          it 'raise error if any negative number is passed' do
            expect { described_class.add("-1\n0") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
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

          it 'raise error if any negative number is passed' do
            expect { described_class.add("-1\n5") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
          end
        end
      end

      context 'when there are more then 2 numbers' do
        context 'when there are 3 numbers' do
          context 'all numbers are non zero' do
            it 'should return sum of all 3 numbers' do
              expect(described_class.add("1\n2\n3")).to eq(6)
            end

            it 'raise error if any negative number is passed' do
              expect { described_class.add("-1\n2\n5") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
            end
          end

          context '1 number is zero and rest are non zero' do
            it 'should return sum of all 3 numbers' do
              expect(described_class.add("1\n0\n3")).to eq(4)
            end

            it 'raise error if any negative number is passed' do
              expect { described_class.add("-1\n0\n5") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
            end
          end
        end

        context 'when there are 6 numbers' do
          context 'all numbers are non zero' do
            it 'should return sum of all 6 numbers' do
              expect(described_class.add("1\n2\n3\n3\n8\n10")).to eq(27)
            end

            it 'raise error if any negative number is passed' do
              expect { described_class.add("-1\n2\n3\n3\n8\n10") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
            end
          end

          context '1 number is zero and rest are non zero' do
            it 'should return sum of all 6 numbers' do
              expect(described_class.add("1\n2\n3\n0\n8\n10")).to eq(24)
            end

            it 'raise error if any negative number is passed' do
              expect { described_class.add("-1\n2\n-3\n0\n8\n10") }.to raise_error(RuntimeError, "negative numbers not allowed -1, -3")
            end
          end
        end
      end
    end

    context 'when delimiters are both \n and ,' do
      it 'returns 0 for an empty string' do
        expect(described_class.add("")).to eq(0)
      end

      context 'when there is only one number' do
        it 'returns the same number which is passed' do
          expect(described_class.add("1")).to eq(1)
        end

        it 'raise error if any negative number is passed' do
          expect { described_class.add("-1") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
        end
      end

      context 'when there is 2 number passed as argument' do
        context 'when one number is 0' do
          it 'should return 0 as result' do
            expect(described_class.add("1,0")).to eq(1)
          end

          it 'raise error if any negative number is passed' do
            expect { described_class.add("-1,0") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
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

          it 'raise error if any negative number is passed' do
            expect { described_class.add("-1\n5") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
          end
        end
      end

      context 'when there are more then 2 numbers' do
        context 'when there are 3 numbers' do
          context 'all numbers are non zero' do
            it 'should return sum of all 3 numbers' do
              expect(described_class.add("1\n2,3")).to eq(6)
            end

            it 'raise error if any negative number is passed' do
              expect { described_class.add("-1\n2,3") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
            end
          end

          context '1 number is zero and rest are non zero' do
            it 'should return sum of all 3 numbers' do
              expect(described_class.add("1,0\n3")).to eq(4)
            end

            it 'raise error if any negative number is passed' do
              expect { described_class.add("-1,0\n3") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
            end
          end
        end

        context 'when there are 6 numbers' do
          context 'all numbers are non zero' do
            it 'should return sum of all 6 numbers' do
              expect(described_class.add("1,2\n3,3\n8\n10")).to eq(27)
            end

            it 'raise error if any negative number is passed' do
              expect { described_class.add("-1,2\n3,3\n-8\n10") }.to raise_error(RuntimeError, "negative numbers not allowed -1, -8")
            end
          end

          context '1 number is zero and rest are non zero' do
            it 'should return sum of all 6 numbers' do
              expect(described_class.add("1\n2\n3,0,8\n10")).to eq(24)
            end

            it 'raise error if any negative number is passed' do
              expect { described_class.add("-1\n2\n3,0,-8\n10") }.to raise_error(RuntimeError, "negative numbers not allowed -1, -8")
            end
          end
        end
      end
    end

    context 'with custom delimiters' do
      context 'with delimiter as ;' do
        it 'should return sum when there are 2 numbers' do
          expect(described_class.add("//;\n1;2")).to eq(3)
        end

        it 'should return sum when there are 4 numbers' do
          expect(described_class.add("//;\n1;2;10;20")).to eq(33)
        end

        it 'raise error if any negative number is passed' do
          expect { described_class.add("//;\n-1;2;-10;20") }.to raise_error(RuntimeError, "negative numbers not allowed -1, -10")
        end
      end

      context 'with delimiter as ,' do
        it 'should return sum when there are 2 numbers' do
          expect(described_class.add("//,\n1,2")).to eq(3)
        end

        it 'should return sum when there are 4 numbers' do
          expect(described_class.add("//,\n1,2,10,20")).to eq(33)
        end

        it 'raise error if any negative number is passed' do
          expect { described_class.add("//,\n-1,2,-10,20") }.to raise_error(RuntimeError, "negative numbers not allowed -1, -10")
        end
      end

      context 'with delimiter as &' do
        it 'should return sum when there are 2 numbers' do
          expect(described_class.add("//&\n1&2")).to eq(3)
        end

        it 'should return sum when there are 4 numbers' do
          expect(described_class.add("//&\n1&2&10&20")).to eq(33)
        end

        it 'raise error if any negative number is passed' do
          expect { described_class.add("//&\n-1&2&-10&20") }.to raise_error(RuntimeError, "negative numbers not allowed -1, -10")
        end
      end
    end
  end
end
