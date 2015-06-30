require 'rails_helper'

RSpec.describe Homework::Meta::Subtask::Row do
  describe '#build_instance' do
    let(:homework_meta_row) {build :homework_meta_row}

    subject{homework_meta_row.build_instance}

    it {is_expected.to be_a(Homework::Subtask::Row)}

    it 'has meta' do
      expect(subject.meta).to eq(homework_meta_row)
    end

    it 'has same fields' do
      expect(subject.colspan).to eq(homework_meta_row.colspan)
      expect(subject.rowspan).to eq(homework_meta_row.rowspan)
      expect(subject.cells).to eq(homework_meta_row.meta_cells)
    end
  end
end