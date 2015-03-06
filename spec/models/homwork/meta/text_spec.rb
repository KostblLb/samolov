require 'rails_helper'

RSpec.describe Homework::Meta::Text do
  describe '#build_t' do
    let(:homework_meta_text) {build :homework_meta_text}

    subject{homework_meta_text.build_t}

    it {is_expected.to be_a(Homework::Task::Text)}
  end
end