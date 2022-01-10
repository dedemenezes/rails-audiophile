FactoryBot.define do
  factory :order do
    state { "MyString" }
    product_slug { "MyString" }
    amount { "" }
    checkout_session_id { "MyString" }
    user { nil }
    product { nil }
  end
end
