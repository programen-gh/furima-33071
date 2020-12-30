FactoryBot.define do
  factory :item do
    name                {'単体テストコード'}
    description         {'単体テストコードです'}
    category_id         { 2 }
    condition_id        { 2 }
    delivery_burden_id  { 2 }
    prefecture_id       { 2 }
    days_to_delivery_id { 2 }
    price               { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
