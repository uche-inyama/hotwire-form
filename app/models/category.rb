class Category < ApplicationRecord
  has_many :discussions

  scope :sorted, -> { order(name: :asc) }
end
