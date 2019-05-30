RSpec.describe BAPRiskCalc do
  let(:age) { 45 }

  subject { BAPRiskCalc.new(age: age) }

  context 'validations' do
    let(:age) { 20 }
    it 'ensures age is greater than 40' do
      expect { subject.valid? }.to raise_error 'Age must be greater than or equal to 41'
    end

    # ...
  end

  context '#score' do
    it 'calculates something' do
      expect(subject.score).to eq 3
    end

    # ...
  end
end
