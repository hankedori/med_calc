RSpec.describe BAPRiskCalc do
  let(:age) { 45 }
  let(:bun) { 22 }
  let(:gcs) { 15 }
  let(:pulse) { 108 }

  subject { BAPRiskCalc.new(age: age, bun: bun, gcs: gcs, pulse: pulse) }

  context 'validations' do
    let(:age) { 20 }
    it 'ensures age is greater than 40' do
      expect { subject.valid? }.to raise_error 'Age must be greater than or equal to 41'
    end

    # ...
  end

  describe '#score' do
    context 'all no, age < 65' do
      it 'calculates score' do
        expect(subject.score).to eq 1
      end
    end

    context 'all no, age >= 65' do
      let(:age) { 80 }
      it 'calculates score' do
        expect(subject.score).to eq 2
      end
    end

    context 'bun yes, gcs yes' do
      let (:bun) { 26 }
      let (:gcs) { 13 }
      it 'calculates score' do
        expect(subject.score).to eq 4
      end
    end

    context 'all yes' do
      let (:bun) { 26 }
      let (:gcs) { 13 }
      let (:pulse) { 111 }
      it 'calculates score' do
        expect(subject.score).to eq 5
      end
    end

  end

end
