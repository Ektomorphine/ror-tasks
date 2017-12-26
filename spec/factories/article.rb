FactoryBot.define do 
  factory :article do
    title { Faker::ChuckNorris.fact }
    text { Faker::Lorem.paragraphs }
    author

    after(:create) do |article|
      article.comments =
        FactoryBot.create_list(:comment, rand(10), article: article)
      article.tags = Tag.order("RANDOM()").first(3)
    end
  end
end
