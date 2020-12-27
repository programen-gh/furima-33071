FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '田中' }
    first_name_katakana   { 'タロウ' }
    last_name_katakana    { 'タナカ' }
    birthday              { '2020-12-27' }
  end
end
