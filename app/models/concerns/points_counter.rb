module PointsCounter
  def max_points
    double_if_necessary(scale.points_for 0)
  end

  def points
    if finished?
      double_if_necessary(scale.points_for mistakes_count)
    else
      0
    end
  end

  protected
  def double_if_necessary(points)
    unit.try(:is_exam) ? points * 2 : points
  end
end