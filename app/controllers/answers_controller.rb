class AnswersController < ApplicationController
  def new
    @lesson = Lesson.find(params[:lesson_id])
    @category = Category.find(@lesson.category_id)
    @word = @lesson.next_word
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @category = Category.find(@lesson.category_id)
    @answer = @lesson.answers.build(answer_params)
    if @answer.save
      if @lesson.next_word.nil?
        redirect_to lesson_url(@lesson)
      else
        redirect_to new_lesson_answer_url(@lesson)
      end
    end
  end

private  
  def answer_params
    params.permit(:choice_id, :word_id, :lesson_id)
  end
end
