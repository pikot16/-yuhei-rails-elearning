class Category < ApplicationRecord
  validates :title, presence:true, length: { maximum:100, minimum:1 }
  validates :description, length: { maximum: 100 }
end
