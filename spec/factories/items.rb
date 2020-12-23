FactoryBot.define do
  factory :item do
    product_name    { "aaaAAA111あああ１１１" }
    text            { "aaaAAA111あああ１１１" }
    category_id     { 2 }
    state_id        { 2 }
    burden_id       { 2 }
    prefecture_id   { 2 }
    day_id          { 2 }
    price           { 25000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('Public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
