# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    sender_id 1
    recipient_id 1
    title "MyString"
    body "MyText"
  end
end

Factory.define :user do |u|
  u.first_name { Faker::Name.first_name }
  u.last_name { Faker::Name.last_name }
end
