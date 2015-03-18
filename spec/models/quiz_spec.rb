require 'rails_helper'

describe Quiz do
  describe '#unit' do
    let(:unit){create :unit}
    subject{quiz.unit}
    context 'present quiz socket' do
      let(:quiz) {unit.quiz}
      it{is_expected.to eq unit}
    end

    context 'present case socket' do
      let(:quiz) {unit.case}
      it{is_expected.to eq unit}
    end
  end
end