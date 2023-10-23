# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  it 'is valid with valid attributes' do
    user = described_class.new(attributes_for(:user))
    expect(user).to be_valid
  end

  it 'is not valid without a username' do
    user = described_class.new(username: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid without an email' do
    user = described_class.new(email: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid without a password' do
    user = described_class.new(password: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid with a duplicate email' do
    create(:user, email: 'duplicate@example.com')
    user = described_class.new(email: 'duplicate@example.com')
    expect(user).not_to be_valid
  end

  # it 'has a role' do
  #   user = build(:user, :member)
  #   expect(user).to be_member
  # end
end
