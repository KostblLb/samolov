require 'rails_helper'

describe Homework::Meta::Task do
  describe '#build_instance' do
    let(:meta_task) {create :homework_meta_task}
    subject{meta_task.build_instance}

    it {is_expected.to be_a(Homework::Task)}
    it 'has ref to meta task' do
      expect(subject.meta).to eq(meta_task)
    end
  end
end