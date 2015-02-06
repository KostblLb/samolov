FactoryGirl.define do
  factory :scale do
    name "MyString"
    sections do
      [
        build(:section, from: 0, to: 2, points: 5),
        build(:section, from: 3, to: 5, points: 4),
        build(:section, from: 6, to: 7, points: 3),
        build(:section, from: 8, to: 9, points: 2),
        build(:section, from: 10, to: 11, points: 1),
        build(:section, from: 11, points: 0)
      ]
    end
  end
end
