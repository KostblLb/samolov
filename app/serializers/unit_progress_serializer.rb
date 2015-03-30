class UnitProgressSerializer < ActiveModel::Serializer
  attributes :id, :state, :points, :max_points, :user_id, :unit_id, :homework_progress_id, :quiz_progress_id,
             :case_progress_id, :is_exam, :webinar_score, :deadline, :video_deadline, :quiz_deadline,
             :summary_deadline, :case_deadline, :webinar_deadline, :homework_deadline

  def state
    @object.state.to_s
  end

  def homework_progress_id
    @object.homework_progress.try(:id)
  end

  def quiz_progress_id
    @object.quiz_progress.try(:id)
  end

  def case_progress_id
    @object.case_progress.try(:id)
  end
end