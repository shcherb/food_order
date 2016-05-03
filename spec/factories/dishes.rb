FactoryGirl.define do
  factory :dish do
    sequence(:name) {|i| "Dish #{ i }" }
    description 'dish consist from:'
    price 10
    association(:category)
  end
end
