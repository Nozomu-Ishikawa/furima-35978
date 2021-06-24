FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipped_area_id { "2" }
    municipality { "1" }
    address { '1-1' }
    builing_name { '地中海'}
    phone_number { '00000000000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end