FactoryBot.define do
  factory :order do
    address { "MyString" }
    permanent_address { "MyString" }
    mobile_no { 8988828398 }
    total { 0 }
    pincode { 452020 }
    user_id { 1 }
  end
end
