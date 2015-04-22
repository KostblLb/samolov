module Homework
  class Progress
    include Mongoid::Document
    include PointsCounter

    field :name
    field :is_complete

    belongs_to :student, class_name: 'User', inverse_of: :my_homeworks
    belongs_to :unit_progress, class_name: 'UnitProgress', inverse_of: :homework_progress

    embeds_many :tasks, class_name: 'Homework::Task', inverse_of: :progress, cascade_callbacks: true

    accepts_nested_attributes_for :tasks

    delegate :teacher, :scale, :unit, to: :unit_progress

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

      event :complete do
        transition :in_progress => :review
      end
      event :verify do
        transition :review => :verified
      end
      before_transition :on => :complete do |homework_progress|
        homework_progress.unit_progress.next_step unless homework_progress.unit_progress.done?
      end
    end

    private
      def finished?
        verified?
      end

      def double_if_necessary(points)
        points * 2
      end

      def create_tasks
        homework_metas.each do |meta|
          meta.create_tasks_by_meta(self, meta)
        end
      end
  end
end