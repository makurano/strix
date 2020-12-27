FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) + 'a1' }
    password_confirmation { password }
    birthday { '1980-12-25' }

    transient do
      person { Gimei.name }
    end
    last_name { person.last.kanji }
    last_name_en { person.last.romaji }
    first_name { person.first.kanji }
    first_name_en { person.first.romaji }
  end
end
