# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
    user_id 1
    partner_id 1
    message "MyString"
    status "MyString"
  end
end
