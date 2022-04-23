FactoryBot.define do
  factory :meeting do
    association :user

    content               { '日本代表との試合について'  }
    attack                { 'シュートを多く打つ'  }
    defence               { 'アグレッシブな守備'  }
    attack_url            { 'Faker::Internet.url'  }
    defence_url           { 'Faker::Internet.url'  }
  end
end