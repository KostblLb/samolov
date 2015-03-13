require 'rails_helper'

RSpec.describe Homework::Subtask::PositionProfile do

  before(:each) {homework_progress.save}
  describe 'create position profile' do
    let(:homework_progress){create :homework_progress}

    it 'creates two profile' do
      expect(homework_progress.tasks[0].subtasks[1].profile_compulsory).to be_persisted
      expect(homework_progress.tasks[0].subtasks[1].profile_desirable).to be_persisted
    end
  end
end