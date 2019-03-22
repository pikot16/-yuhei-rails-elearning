class Lesson < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers
  belongs_to :category
  belongs_to :user

  def next_word
    (category.words - words).first # No need to write lesson.words because already inside lesson.rb
  end
end
