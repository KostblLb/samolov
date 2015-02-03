class Answer
  include Mongoid::Document

  field :text
  field :is_correct, type: Boolean

  belongs_to :question

end