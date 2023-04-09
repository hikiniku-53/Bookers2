class UsersController < ApplicationController
    before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @users = User.all
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.find(params[:id])
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end

end
