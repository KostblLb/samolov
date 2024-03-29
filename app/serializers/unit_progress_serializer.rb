class UnitProgressSerializer < ActiveModel::Serializer
  attributes :id, :points, :max_points, :unit_id, :homework_progress_id, :quiz_progress_id,
             :case_progress_id, :is_exam, :webinar_score, :deadline, :quiz_deadline, :case_deadline, :webinar_deadline,
             :homework_deadline, :unit_beginning, :case_progress_points, :quiz_progress_points, :homework_progress_state,
             :homework_progress_points, :course_part_progress_id, :webinar, :video_complete, :quiz_complete,
             :summary_complete, :case_complete, :webinar_complete, :homework_complete, :webinar_beginning, :user_id

  # def state
  #   @object.state.to_s
  # end

  def homework_progress_id
    @object.homework_progress.try(:id)
  end

  def quiz_progress_id
    @object.quiz_progress.try(:id)
  end

  def case_progress_id
    @object.case_progress.try(:id)
  end

  def case_progress_points
    @object.case_progress.points unless @object.case_progress.nil?
  end

  def quiz_progress_points
    @object.quiz_progress.points unless @object.quiz_progress.nil?
  end

  def homework_progress_points
    @object.homework_progress.points unless @object.homework_progress.nil?
  end

  def homework_progress_state
    @object.homework_progress.state unless @object.homework_progress.nil?
  end
end