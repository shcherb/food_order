FactoryGirl.define do
  factory :user do
    sequence(:email) {|i| 'user#{i}@example.org'}
    password '12345678'
  end
end
