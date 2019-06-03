RSpec.describe DecafRiskCalc do
  let(:age) { 40 }
  let(:emrcd) { 2 }
  let(:eosinophils) { 0.04e+09 }
  let(:chest_x_ray_consolidation) { 0 }
  let(:pH) { 8.00 }
  let(:atrial_fibrillation) { 1 }

  subject { DecafRiskCalc.new(age: age,
                          emrcd: emrcd,
                          eosinophils: eosinophils,
                          chest_x_ray_consolidation: chest_x_ray_consolidation,
                          pH: pH,
                          atrial_fibrillation: atrial_fibrillation) }


  context 'validations' do
    context 'emrcd invalid' do
      let(:emrcd) { -1 }

      it 'ensures emrcd is between 0 and 2' do
        expect { subject.valid? }.to raise_error 'Emrcd must be greater than or equal to 0'
      end
    end

    context 'atrial_fibrillation invalid' do
      let(:atrial_fibrillation) { 3 }
      it 'ensures atrial_fibrillation is either 0 or 1' do
        expect { subject.valid? }.to raise_error 'Atrial fibrillation not an allowable number'
      end
    end
  end

  # test for age >= 35
  context 'decaf score calculations' do
    context '#decaf_score' do
      #let(:emrcrd) { 2 }
      it 'calculates decaf score' do
        expect(subject.decaf_score).to eq 4
      end
    end

    context 'pH < 7' do
      let(:pH) { 6.00 }
      it 'calculates decaf score' do
        expect(subject.decaf_score).to eq 5
      end
    end

    context 'all yes' do
      let(:pH) { 6.00 }
      let(:chest_x_ray_consolidation) { 1 }
      it 'calculates decaf score' do
        expect(subject.decaf_score).to eq 6
      end
    end

  end
end
