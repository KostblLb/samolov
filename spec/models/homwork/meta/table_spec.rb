require 'rails_helper'

RSpec.describe Homework::Meta::Subtask::Table do
  describe '#build_t' do
    let(:homework_meta_table) {build :homework_meta_table}

    subject{homework_meta_table.build_subtsk}
    it {is_expected.to be_a(Homework::Subtask::Table)}

    it 'has column names' do
      expect(subject.col_names).to eq(['col 1', 'col 2'])
    end

    it 'has correct rows' do
      expect(subject.rows.size).to eq(2)
      expect(subject.rows.first.name).to eq('this is row')
      expect(subject.rows.first.cells.size).to eq(2)
    end
  end
end