FactoryGirl.define do
  factory :category do
    title  { Faker::Lorem.sentence }
    desc { Faker::Lorem.sentence }
    # association :author, factory: :user, strategy: :build
  end
end
