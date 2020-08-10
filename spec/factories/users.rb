FactoryBot.define do
  factory :user do
    nickname          {Faker::Name.initials(number: 2)}
    email             {Faker::Internet.free_email}
    password = "abcdefg8"
    password {password}
    password_confirmation {password}
    gimei = Gimei.name
    last_name         {gimei.last.kanji}
    first_name        {gimei.first.kanji}
    last_kana_name    {gimei.last.katakana}
    first_kana_name    {gimei.first.katakana}
    birth             {Faker::Date.in_date_period}
  end
end