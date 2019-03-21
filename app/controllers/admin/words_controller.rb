class Admin::WordsController < AdminController
  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build # 特定のカテゴリIDをもつ空のレコードを作る
    3.times {
      @word.choices.build
    } 
  end

  def index
    @category = Category.find(params[:category_id])
    # @words = Word.where(category_id: params[:category_id])
    @words = @category.words # refactored from the above code
  end

  def edit
    @category = Category.find(params[:category_id]) # これを書いていなくてwordのIDが/:category_idの部分に入ってしまっていた
    @word = Word.find(params[:id])
  end  

  def create
    category = Category.find(params[:category_id])
    @word = category.words.build(word_params)
    
    if @word.save # 親要素を保存かけてあげることで自動で子要素も保存される
      flash[:success] = "Successfully Created"
      redirect_to admin_category_words_path
    else
      render 'new' # new.html.erb
    end
  end

  def update
    @word = Word.find(params[:id])
    @category = Category.find(params[:category_id])
    if @word.update_attributes(word_params)
      flash[:success] = "Successfully Updated Profile"
      redirect_to admin_category_words_path
    else
      render 'edit' # edit.html.erb
    end
  end

  def destroy
    cat = Category.find(params[:category_id])
    cat.words.find(params[:id]).destroy
    flash[:success] = "Word deleted"
    redirect_to admin_category_words_path
  end  

  private

  def word_params
    params.require(:word).permit(:content, choices_attributes: [:id, :content, :correct])
  end
end