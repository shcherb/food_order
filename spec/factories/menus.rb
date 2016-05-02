FactoryGirl.define do
  factory :menu do
    name 'First menu'
    url 'http://test.org'
    association(:user)
  end
end
