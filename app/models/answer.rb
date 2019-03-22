class Answer < ApplicationRecord
  belongs_to :choice
  belongs_to :word
  belongs_to :lesson
end
