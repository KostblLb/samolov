require 'rails_helper'

RSpec.describe Homework::Task::Table do
  before(:each) {subject.save}
  describe 'create table' do
    let(:homework_progress){create :homework_progress}
    subject{create :homework_task_table, progress: homework_progress}

    it 'creates all fields correct' do
      expect(subject.col_names).to eq(['a','b','c'])
      expect(subject.rows.count).to eq(2)
      expect(subject.rows.first.name).to eq('row')
      expect(subject.rows.first.cells.count).to eq(3)
    end
    it 'still works after reload model' do
      expect(subject.reload.col_names).to eq(['a','b','c'])
      expect(subject.reload.rows.count).to eq(2)
      expect(subject.reload.rows.first.name).to eq('row')
      expect(subject.reload.rows.first.cells.count).to eq(3)
    end
  end
end