require 'rails_helper'

RSpec.describe Homework::Meta::Subtask::Multiline do
  describe '#build_instance' do
    let(:homework_meta_multiline) {build :homework_meta_multiline}

    subject{homework_meta_multiline.build_instance}

    it {is_expected.to be_a(Homework::Subtask::Multiline)}

    it 'has meta' do
      expect(subject.meta).to eq(homework_meta_multiline)
    end

    it 'has line_names'do
      expect(subject.line_names).to eq(homework_meta_multiline.line_names)
    end

  end
end