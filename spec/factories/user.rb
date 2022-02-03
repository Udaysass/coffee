FactoryBot.define do
  factory :user do
   sequence (:email)  {|n| "hello+#{n}@gmail.com" }
    password { '123456' }
    password_confirmation { '123456' }
  end
end