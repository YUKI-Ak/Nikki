FactoryBot.define do
  factory :comment do

    comment   { Faker::Lorem.characters(number: 200) }

    association :article
    user {article.user}
  end
end
