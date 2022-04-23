FactoryBot.define do
  factory :comment do
    association :user
    association :meeting

    text               {  'Faker::Lorem.sentence'  }
  end
end