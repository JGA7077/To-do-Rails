class Todo < ApplicationRecord
  belongs_to :category

  validates :title, presence: :true
  validates :description, length: { maximum: 50 }
end
