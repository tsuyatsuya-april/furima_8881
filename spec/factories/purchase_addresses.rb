FactoryBot.define do
  factory :purchase_address do
    postalcode { '572-0039' }
    prefecture_id { 2 }
    city { '新宿区' }
    street { '４−３−１' }
    building { '如月ビル４０２' }
    phone_number { '09096234419' }
    token { 'tok_353c67af70c6caafbd7c4421dd68' }
  end
end
