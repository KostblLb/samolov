module Homework
  class Progress
    include Mongoid::Document

    field :name
    field :is_complete


    belongs_to :unit_progress, class_name: 'UnitProgress', inverse_of: :homework_progress

    embeds_many :tasks, class_name: 'Homework::Task', inverse_of: :progress, cascade_callbacks: true

    accepts_nested_attributes_for :tasks

    delegate :teacher, :scale, to: :unit_progress

    after_save :resolve_state

    def total_tasks
      tasks.count
    end

    def max_points
      scale.points_for 0
    end

    def points
      if state == 'verified'
        scale.points_for mistakes_counter
      else
        0
      end
    end

    def correct_answer_counter
      tasks.where(is_correct: true).size
    end

    def mistakes_counter
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
      def create_tasks
        homework_metas.each do |meta|
          meta.create_tasks_by_meta(self, meta)
        end
      end
  end
end