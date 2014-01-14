FactoryGirl.define do
  factory :team do
    name { Faker::Name.first_name }
    role { Faker::Lorem.paragraph }
  end
end
