FactoryBot.define do
  factory :author do 
    name { Faker::Name.name }
    email { Faker::Internet.email }
    city { Faker::Address.city }
    address { Faker::Address.street_name }
    birth_date { Faker::Date.birthday(20, 40) }

    after(:create) do |author|
      author.articles << FactoryBot.create_list(:article, rand(10), author: author)
    end          
  end
end
