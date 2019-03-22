class Word < ApplicationRecord
  has_many :choices, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :lessons, through: :answers
  belongs_to :category
  accepts_nested_attributes_for :choices 
  validates :content, presence: true, length: { maximum:50, minimum:1 }
  
  validate :correct_validation

  def correct_validation
    correct = choices.collect do |c| # @word.choicesと書いてはいけない
              c.correct || nil # false || nil == nil
    end
    if correct.compact.size > 1
      errors.add(:correct, "can be only one") # エラーを表示させなかったら保存される
    elsif correct.compact.size < 1
      errors.add(:correct, "can't be blank")
    end
    # compactメソッドで配列からnilを除外する 
  end
end



