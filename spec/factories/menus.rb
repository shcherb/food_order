FactoryGirl.define do
  factory :menu do
    name 'First menu'
    url 'http://test.org'
    factory :menu_with_dishes do
      transient do
        dishes_count 3
      end

      after(:create) do
        create_list(:dish, 3)
      end
    end
    association(:user)
  end
end
