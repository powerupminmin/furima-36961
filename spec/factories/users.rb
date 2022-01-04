FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password             =('1a' + Faker::Internet.password(min_length: 6))
    password              {password}
    password_confirmation {password}
    family_name           { person.last.kanji}
    first_name            { person.first.kanji}
    family_name_kana      { person.last.katakana }
    first_name_kana       { person.first.katakana }
    born_day              { Faker::Date.between(from:'1930-01-01',to:
                            5.years.ago)}
  end
end
