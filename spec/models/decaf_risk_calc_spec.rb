RSpec.describe DecafRiskCalc do
  let(:emrcd) { 2 }

  subject { DecafRiskCalc.new(emrcd: emrcd) }

  context 'validations' do
    let(:emrcd) { -1 }
    it 'ensures emrcd is between 0 and 2' do
      expect { subject.valid? }.to raise_error 'Emrcd must be greater than or equal to 0'
    end

    # ...
  end

  context '#decaf_score' do
    it 'calculates something' do
      expect(subject.decaf_score).to eq 3
    end

    # ...
  end
end
