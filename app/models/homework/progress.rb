module Homework
  class Progress
    include Mongoid::Document
    include PointsCounter

    field :name
    field :is_complete


    belongs_to :unit_progress, class_name: 'UnitProgress', inverse_of: :homework_progress

    embeds_many :tasks, class_name: 'Homework::Task', inverse_of: :progress, cascade_callbacks: true

    accepts_nested_attributes_for :tasks

    delegate :teacher, :scale, :unit, to: :unit_progress

    after_save :resolve_state

    def total_tasks
      tasks.count
    end

    def correct_answer_counter
      tasks.where(is_correct: true).size
    end

    def mistakes_count
      total_tasks - correct_answer_counter
    end

    state_machine :initial => :in_progress do

      state :in_progress

      state :review

      state :verified

      event :next_step do
        transition :in_progress => :review, :review => :verified
      end
    end

    def resolve_state
      if is_complete
        unit_progress.state = 'done'
      end
    end

    private
      def finished?
        verified?
      end

      def create_tasks
        homework_metas.each do |meta|
          meta.create_tasks_by_meta(self, meta)
        end
      end
  end
end