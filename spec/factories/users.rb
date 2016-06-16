FactoryGirl.define do
  factory :user do
    name  { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password  { Faker::Internet.password(8) }

    trait :admin do
      role 'admin'
    end

    trait :banned do
      role 'banned'
    end

  end
end
