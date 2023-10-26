class Entity < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
