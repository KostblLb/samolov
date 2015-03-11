require 'rails_helper'

RSpec.describe Homework::Meta::Subtask::Text do
  describe '#build_t' do
    let(:homework_meta_text) {build :homework_meta_text}

    subject{homework_meta_text.build_subtsk}

    it {is_expected.to be_a(Homework::Subtask::Text)}
  end
end