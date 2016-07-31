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

require 'rails_helper'

RSpec.describe Post, type: :model do
  
  it 'is valid factory for :post' do
    expect(create(:post)).to be_valid
  end
  
 it 'checks empty post title' do
    post = build(:post, title: nil)
    post.valid?
    expect(post.errors[:title]).to include I18n.t('errors.messages.blank')
  end

  it 'take short post title' do
    post = build(:post,  title: 'test')
    post.valid?
    expect(post.errors[:title]).to include I18n.t('errors.messages.too_short.many', count: 6)
  end

  it 'take uniq post title' do
    create(:post, title: 'uniqueness')
    post2 = build(:post,  title: 'uniqueness')
    post2.valid?
    expect(post2.errors[:title]).to include I18n.t('errors.messages.taken')
  end

  it 'take max length limit for post title' do
    post = build(:post, title: 'X' * 444)
    post.valid?
    expect(post.errors[:title]).to include I18n.t('errors.messages.too_long.many', count: 128)
  end
end
