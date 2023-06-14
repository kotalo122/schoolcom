FactoryBot.define do
  factory :room do
    name      {Faker::Team.name}
    grade_id  {Faker::Number.between(from: 2, to: 11)}
  end
end