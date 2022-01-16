FactoryBot.define do
  factory :item do
    name            {Faker:: Name.name}
    description     {Faker:: Lorem.sentence}
    category_id     { 2 }
    status_id       { 2 }
    charge_id       { 2 }
    area_id         { 2 }
    delivery_day_id { 2 }
    price           {Faker::Number.within(range: 300..9_999_999)}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
