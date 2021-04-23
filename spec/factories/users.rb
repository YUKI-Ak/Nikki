FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              { person.kanji }
    email                 { Faker::Internet.free_email }
    password              { "0000aa" }
    password_confirmation { password }
    last_name           { person.last.kanji }
    first_name             { person.first.kanji }
    lname_kana            { person.last.katakana }
    fname_kana            { person.first.katakana }
    birthday              { "1990/1/1" }
  end
end