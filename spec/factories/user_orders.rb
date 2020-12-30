FactoryBot.define do
  factory :user_order do
    postal_code    { "111-1111" }
    prefecture_id  { 2 }
    city           { "旭川市" }
    address        { "旭川100" }
    building       { "ビル" }
    phone_number   { "11111111111" }
    token          { "tok_abcdefghijk00000000000000000" }
    user_id        { 1 }
    item_id        { 1 }
  end
end
