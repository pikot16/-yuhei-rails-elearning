class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy
  validates :title, presence:true, length: { maximum:50, minimum:1 }
  validates :description, length: { maximum: 200 }

  def get_lesson(current_user)
    lessons.find_by(user_id: current_user.id)
  end
end
