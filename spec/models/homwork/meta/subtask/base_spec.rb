require 'rails_helper'

RSpec.describe Homework::Meta::Subtask::Base do
  describe '#build_instance' do
    subject{meta_task.build_instance}

    context 'base class' do
      let(:meta_task) {Homework::Meta::Subtask::Base.new}

      it {is_expected.to be_a(Homework::Subtask::Base)}
      it 'has ref to meta' do
        expect(subject.meta).to eq(meta_task)
      end
    end

    context 'successor class' do
      class Homework::Subtask::Test < Homework::Subtask::Base; end
      class Homework::Meta::Subtask::Test < Homework::Meta::Subtask::Base; end
      let(:meta_task) {Homework::Meta::Subtask::Test.new}

      it {is_expected.to be_a(Homework::Subtask::Test)}
      it 'has ref to meta' do
        expect(subject.meta).to eq(meta_task)
      end
    end
  end
end