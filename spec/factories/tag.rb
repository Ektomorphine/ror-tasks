FactoryBot.define do 
  factory :tag do
    name { Faker::Pokemon.name }
  end
end
