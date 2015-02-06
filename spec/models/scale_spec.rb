require 'rails_helper'

RSpec.describe Scale, :type => :model do

  describe '#poins_for' do
    let(:scale) {create :scale, is_default: true}
    it 'returns points for mistakes count' do
      expect(scale.points_for 0).to eq(5)
    end
  end

  describe '.default' do
    subject{Scale.default}
    context 'default scale does not exist' do
      it {expect{subject}.to change{Scale.count}.by(1)}
      it {expect{subject}.to change{Scale.where(is_default: true).count}.by(1)}
    end
    context 'default scale exist' do
      let(:scale) {create :scale, is_default: true}
      before(:each) {scale}
      it{is_expected.to eq(scale)}
    end
  end

  describe '.create_default!' do
    subject{Scale.create_default!}
    context 'default scale does not exist' do
      it {expect{subject}.to change{Scale.count}.by(1)}
      it {expect{subject}.to change{Scale.where(is_default: true).count}.by(1)}
    end
    context 'default scale exist' do
      before(:each) {create :scale, is_default: true}
      it{is_expected.to be_falsey}
    end
  end
end
