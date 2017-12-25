FactoryBot.define do 
  factory :article do
    title { Faker::ChuckNorris.fact }
    text { Faker::Lorem.paragraphs } 
    author
  end
end
