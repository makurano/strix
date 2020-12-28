FactoryBot.define do
  factory :article do
    title            { 'テスト用論文' }
    title_en         { 'paper for test'}
    journal_name     { '架空論文誌' }
    publication_date { '1980-12-25' }
    abstract         { Faker::Lorem.sentence }
    category_id      { Faker::Number.between(from: 1, to: 4) }
    association :user

    after(:build) do |article|
      article.article_file.attach(io: File.open('public/pdfs/こころ.pdf'), filename: 'こころ.pdf')
    end
  end
end
