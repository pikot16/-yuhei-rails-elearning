class Choice < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :lessons, through: :answers
  belongs_to :word
  validates :content, presence: true, length: { maximum:50, minimum:1 } # 必要かどうか
end
