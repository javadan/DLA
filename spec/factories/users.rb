FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }

    sequence(:fb_uid) { |n| 100007074455662 + n - 1 }
    fb_username { Faker::Internet.user_name }
    fb_token { SecureRandom.uuid }

    admin false
    profile_updated true

    factory :admin_user do
      admin true
    end
  end
end
