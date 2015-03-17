require 'rails_helper'

RSpec.describe Homework::Subtask::Table do
  before(:each) {homework_progress.save}
  describe 'create table' do
    let(:homework_progress){create :homework_progress_with_table}
    subject{homework_progress.tasks[0].subtasks[0]}

    it 'creates all fields correct' do
      expect(subject.col_names).to eq(['a','b','c'])
      expect(subject.rows.first.colspan).to eq(3)
      expect(subject.rows.first.rowspan).to eq(5)
      expect(subject.rows.count).to eq(2)
      # expect(subject.rows.first.name).to eq('row')
      # expect(subject.rows.first.cells.count).to eq(3)
    end
    it 'still works after reload model' do
      expect(subject.reload.col_names).to eq(['a','b','c'])
      expect(subject.reload.rows.first.colspan).to eq(3)
      expect(subject.reload.rows.first.rowspan).to eq(5)
      expect(subject.reload.rows.count).to eq(2)
      expect(subject.reload.rows.first.name).to eq('row')
      expect(subject.reload.rows.first.cells.count).to eq(3)
    end
  end
end