require 'rails_helper'

RSpec.describe Ability, type: :model do
  it 'visitor can only create comments' do
    user = create(:user, role: :visitor)
    ability = Ability.new(user)
    expect(ability).to have_abilities(:create, build(:comment))
    expect(ability).to not_have_abilities([:update, :destroy, :edit], create(:comment))
  end

  it 'registered user can only destroy comments which he owns' do
    user = create(:user, role: :registered_user)
    ability = Ability.new(user)
    expect(ability).to have_abilities(:destroy, create(:comment, author: user))
    expect(ability).to not_have_abilities(:destroy, create(:comment))
  end

  it 'admin can manage any resource' do
    user = create(:user, role: :administrator)
    ability = Ability.new(user)
    expect(ability).to have_abilities(:manage, create(:category))
    expect(ability).to have_abilities(:manage, create(:post))
    expect(ability).to have_abilities(:manage, build(:user))
  end

  it 'registered user cannot manage users' do
    user = create(:user, role: :registered_user)
    ability = Ability.new(user)
    expect(ability).to not_have_abilities(:manage, build(:user))
  end

  it 'registered user cannot destroy categorys & posts' do
    user = create(:user, role: :registered_user)
    ability = Ability.new(user)
    expect(ability).to not_have_abilities(:manage, build(:category))
    expect(ability).to not_have_abilities(:manage, build(:post))
  end
end