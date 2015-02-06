require 'rails_helper'

RSpec.describe Section, :type => :model do
  describe '#include?' do
    let(:section) {build :section}
    subject{section.include? arg}
    context 'argument >= from and <= to' do
      let(:arg) {5}
      it{is_expected.to be_truthy}
    end
    context 'other case' do
      let(:arg) {1000}
      it{is_expected.to be_falsey}
    end
  end
end
