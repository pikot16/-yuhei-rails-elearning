class CategoriesController < ApplicationController

  def index
    @lesson = Lesson.new
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

end
