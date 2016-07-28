# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  title        :string
#  desc         :text
#  parent_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  childs_count :integer          default(0), not null
#  posts_count  :integer          default(0), not null
#

FactoryGirl.define do
  factory :category do
    title  { Faker::Lorem.sentence }
    desc { Faker::Lorem.sentence }
    # association :author, factory: :user, strategy: :build
  end
end
