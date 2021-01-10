FactoryBot.define do
  factory :profile do
    degree                { Faker::Educator.degree }
    affiliation           { Faker::Educator.university }
    research_fields       { Faker::Educator.subject }
    contact               { Faker::Internet.free_email }
    education             { Faker::Educator.university }
    academic_affiliations { Faker::Educator.subject }
    association :user

    after(:build) do |profile|
      profile.image.attach(io: File.open('public/images/soseki.jpg'), filename: 'soseki.jpg')
    end
  end
end
