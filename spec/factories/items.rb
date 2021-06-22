FactoryBot.define do
  factory :item do
    name                  {"希少！レア品！"}
    description           {"希少レア物です！"}
    category_id           {2}
    status_id             {2}
    shipping_charge_id    {2}
    shipped_area_id       {2}
    day_to_shipped_id     {2}
    price                 {9999}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/sample_image.png'), filename: 'sample_image.png')
    end
  end
end