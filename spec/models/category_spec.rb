require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid factory for :category' do
    expect(create(:category)).to be_valid
  end

  it 'checks empty category title' do
    category = build(:category, title: nil)
    category.valid?
    expect(category.errors[:title]).to include I18n.t('errors.messages.blank')
  end

  it 'checks empty category description' do
    category = build(:category, desc: nil)
    category.valid?
    expect(category.errors[:desc]).to include I18n.t('errors.messages.blank')
  end
end
