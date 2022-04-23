FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email  }
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    name                  { '山田太郎' }
    team_name             { '鹿島アントラーズ' }
    number                { '44' }
  end
end