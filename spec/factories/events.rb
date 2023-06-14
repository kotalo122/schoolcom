FactoryBot.define do
  factory :message do

    event_day  { Faker::Date.between(from: Date.today, to: 1.year.from_now) }
    title      { Faker::Lorem.word }
    content    {Faker::Lorem.sentence}
    grade_id   { Faker::Number.between(from: 2, to: 11) }


    association :user
    association :room

    after(:build) do |event|
      event.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      event.comments << build(:comment, event: event)
    end
  end
end