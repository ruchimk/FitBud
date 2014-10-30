
Factory.define :user do |u|
  u.first_name { Faker::Name.first_name }
  u.last_name { Faker::Name.last_name }
end
