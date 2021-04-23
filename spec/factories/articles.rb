FactoryBot.define do
  factory :article do

    title              { Faker::Lorem.characters(number: 50) }
    content            { "テストテキスト！" }

    # after(:build) do |item|
    #   item.image.attach(io: File.open('./app/assets/images/item-sample.png'), filename: 'item-sample.png')
    # end

    association :user
  end
end
