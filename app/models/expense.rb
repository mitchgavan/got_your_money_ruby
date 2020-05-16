class Expense < ApplicationRecord
  validates :title, presence: true
  validates :cost, presence: true, numericality: true
  validates :date, presence: true
end
