FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "qwerty"
    password_confirmation "qwerty"
  end
end
