FactoryBot.define do
  factory :author do 
    name { Faker::Name.name }
    email { Faker::Internet.email }
    city { Faker::Address.city }
    address { Faker::Address.street_name }
    birth_date { Faker::Date.birthday(20,40) }

    factory :author_with_article do 
      after (:create) do |author, evaluator|
        author.articles << FactoryBot.create(:article)
      end
    end
  end
end