FactoryBot.define do
  factory :item_buy_buyer do
    post_code {'123-4567'}
    area_id {14}
    city {'渋谷区'}
    address {'1-1'}
    building_name {'ハイウェービル'}
    phone_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
