FactoryBot.define do
  factory :item do

    name              {"商品"}
    description       {Faker::Lorem.sentence}
    price              {2000}
    item_condition_id  {2}
    delivery_fee_id   {2}
    area_id            {2}
    delivery_day_id   {2}
    category_id        {2}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
