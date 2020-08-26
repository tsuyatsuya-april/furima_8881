FactoryBot.define do
  factory :purchase_address do
    postalcode { '572-0039' }
    prefecture_id { 2 }
    city { '新宿区' }
    street { '４−３−１' }
    building { '如月ビル４０２' }
    phone_number { '09096234419' }
  end
end
