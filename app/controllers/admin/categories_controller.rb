class Admin::CategoriesController < AdminController
  before_action :logged_in_user
  before_action :admin_user


  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end  

  def edit
    @category = Category.find(params[:id])
  end  

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully Created"
      redirect_to admin_categories_path
    else
      flash[:warning] = "Incorrect"
      render 'new' # new.html.erb
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Successfully Updated Profile"
      redirect_to admin_categories_path # @category ?? # @user ??
      # updateすると更新はされるが/admin/categorires/:idに飛んでアクションがなくてエラーになる
    else
      flash[:warning] = "Incorrect"
      render 'edit' # edit.html.erb
    end
  end

  # def destroy
  #   if @category.delete
  #     flash[:success] = "deleted"
  #   end
  #   redirect_to admin_categories_path
  # end  

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to admin_categories_path
  end  

  private

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please Log In"
      redirect_to root_url
    end
  end  

  def admin_user
    unless current_user.admin?
      flash[:danger] = "You don't have permission to access"
      redirect_to(root_url)
    end
  end
  
  def category_params
    params.require(:category).permit(:title,:description)
  end  

end
