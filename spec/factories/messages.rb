# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    sender_id 1
    recipient_id 1
    title "MyString"
    body "MyText"
  end
end
