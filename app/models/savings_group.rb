# frozen_string_literal: true

class SavingsGroup < ApplicationRecord
  validates :name, presence: true
  validates :start_date, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
