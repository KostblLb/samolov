class Scale
  include Mongoid::Document

  field :name
  field :is_default, type: Boolean, default: false

  has_many :groups

  embeds_many :sections

  after_save :resolve_default
  accepts_nested_attributes_for :sections

  def points_for(misstakes_count)
    (sections.select {|s| s.include? misstakes_count}).first.try(:points) || 0
  end

  def self.default
    default = where(is_default: true).first
    default.nil? ? create_default! : default
  end

  def self.create_default!
    return false unless Scale.where(is_default: true).empty?
    scale = Scale.new is_default: true, name: 'Default', sections: [
                                                                       Section.new(from: 0, to: 2, points: 5),
                                                                       Section.new(from: 3, to: 5, points: 4),
                                                                       Section.new(from: 6, to: 7, points: 3),
                                                                       Section.new(from: 8, to: 9, points: 2),
                                                                       Section.new(from: 10, to: 11, points: 1),
                                                                       Section.new(from: 11, points: 0)
                                                                   ]
    scale.save!
    scale
  end

  private
  def resolve_default
    Scale.where(is_default: true, :id.ne => self.id).update default: false
  end
end
