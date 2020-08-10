FactoryBot.define do
  factory :user do
    nickname          {Faker::Name.name}
    email             {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6, mix_case: true)
    password {password}
    password_confirmation {password}
    last_name         {Faker::Name.last_name} 
    first_name        {Faker::Name.first_name} 
    last_kana_name    {Faker::Name.lastKanaName}
    first_kana_name   {Faker::Name.firstKanaName}
    birth             {Faker::Date.in_date_period}
  end
end