class Lesson < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers
  has_many :choices, through: :answers
  belongs_to :category
  belongs_to :user
  has_one :activity, as: :action, dependent: :destroy

  def next_word
    (category.words - words).first # No need to write lesson.words because already inside lesson.rb
  end

  def lesson_result
    choices.where(correct: true).count
  end
end
