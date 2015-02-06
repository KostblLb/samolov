class Section
  include Mongoid::Document

  embedded_in :scale

  field :from,   type: Integer, default: 0
  field :to,     type: Integer, default: 999
  field :points, type: Integer, default: 0

  def include?(integer)
    integer <= to && integer >= from
  end
end
