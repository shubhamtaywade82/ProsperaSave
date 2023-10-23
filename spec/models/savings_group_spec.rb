# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SavingsGroup do
  describe 'validations' do
    it 'is valid with valid attributes' do
      savings_group = described_class.new(
        name: 'Example Group',
        start_date: Time.zone.today,
        duration: 12
      )
      expect(savings_group).to be_valid
    end

    it 'is not valid without a name' do
      savings_group = described_class.new(
        name: nil,
        start_date: Time.zone.today,
        duration: 12
      )
      expect(savings_group).not_to be_valid
    end

    it 'is not valid without a start_date' do
      savings_group = described_class.new(
        name: 'Example Group',
        start_date: nil,
        duration: 12
      )
      expect(savings_group).not_to be_valid
    end

    it 'is not valid without a duration' do
      savings_group = described_class.new(
        name: 'Example Group',
        start_date: Time.zone.today,
        duration: nil
      )
      expect(savings_group).not_to be_valid
    end

    it 'is not valid with a non-integer duration' do
      savings_group = described_class.new(
        name: 'Example Group',
        start_date: Time.zone.today,
        duration: 'not_an_integer'
      )
      expect(savings_group).not_to be_valid
    end

    it 'is not valid with a duration less than or equal to 0' do
      savings_group = described_class.new(
        name: 'Example Group',
        start_date: Time.zone.today,
        duration: 0
      )
      expect(savings_group).not_to be_valid
    end
  end
end
