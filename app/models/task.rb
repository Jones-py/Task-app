class Task < ApplicationRecord
  default_scope { order(created_at: :desc)}
  validates :name, presence: true, uniqueness: true, length: { maximum:50}
  validates :Details, presence: true, length: { maximum: 200}
end
