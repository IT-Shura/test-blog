# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  category_id :integer
#  approved_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  views_count :integer          default(0)
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#  index_posts_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_5b5ddfd518  (user_id => users.id)
#  fk_rails_9b1b26f040  (category_id => categories.id)
#

FactoryGirl.define do
  factory :post do
    title  { Faker::Lorem.sentence(rand(5..10)) }
    content  { Faker::Lorem.sentence( rand(100..1000) ) }
    association :author, factory: :user

    category
  end

  # factory :post_with_tags, class: Post do
  #   name  { Faker::Lorem.sentence(rand(5..10)) }
  #   content  { Faker::Lorem.sentence( rand(100..1000) ) }
  #   association :author, factory: :user#, strategy: :build #makes error when testing posts#show
  #                                       # user cant been found in DB
  #   rating { rand(1..789) }
  #   tag_list "tag1, tag2, tag3"
  #   blog
  # end
end
