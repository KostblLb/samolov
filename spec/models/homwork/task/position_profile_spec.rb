require 'rails_helper'

RSpec.describe Homework::Subtask::PositionProfile do

  before(:each) {homework_progress.save}
  describe 'create position profile' do
    let(:homework_progress){create :homework_progress}

    it 'creates two profile' do
      expect(homework_progress.tasks[0].subtasks[1].profile_compulsory).not_to be_nil
      expect(homework_progress.tasks[0].subtasks[1].profile_desirable).not_to be_nil
      expect(homework_progress.reload.tasks[0].subtasks[1].profile_compulsory).not_to be_nil
    end
  end
end