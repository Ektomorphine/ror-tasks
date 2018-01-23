FactoryBot.define do 
  factory :comment do
    commenter { Faker::Name.name }
    text { Faker::ChuckNorris.fact }
    article
  end
end
