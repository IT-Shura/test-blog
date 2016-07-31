FactoryGirl.define do
  factory :comment do
    content { Faker::Lorem.sentence(15) }
    post
    author  { create(:user) }
  end
end