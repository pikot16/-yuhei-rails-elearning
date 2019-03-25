class LessonsController < ApplicationController
  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to new_lesson_answer_url(@lesson)
    end
  end

  def show
    @lesson = Lesson.find(params[:id]) # lesson_idではない
  end

private
  def lesson_params
    params.permit(:category_id).merge(user_id: current_user.id)
    # categoryページなので.require(:lesson)はいらない
    # mergeを書かずにform_forにhidden_field_tagで書くことも可能
  end
end
