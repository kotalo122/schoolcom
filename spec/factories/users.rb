FactoryBot.define do
  factory :user do
    name                   {Faker::Name.last_name}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    position_id            {Faker::Number.between(from: 2, to: 3)}
    position_code          {Faker::Number.number(digits: rand(4..11))}
  end
end
