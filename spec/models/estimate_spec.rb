require 'rails_helper'

RSpec.describe Estimate, :type => :model do

  describe '#duration' do
    context 'unit is not exam' do
      let(:unit) {create :unit}
      it {expect(unit.estimate.duration).to eq(6)}
    end
  end
end
