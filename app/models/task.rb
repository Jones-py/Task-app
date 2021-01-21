class Task < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  default_scope { order(created_at: :desc)}
  belongs_to :user, optional: true
  validates :name, presence: true, uniqueness: true, length: { maximum:50}
  validates :Details, presence: true, length: { maximum: 21}
end
