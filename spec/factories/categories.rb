FactoryGirl.define do
  factory :category do
    sequence(:name) {|i| "Dish #{ i }" }
  end
end
