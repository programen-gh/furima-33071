FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '豊島区' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '01234567891' }
  end
end
