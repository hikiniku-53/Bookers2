class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @users = User.all
    @user = User.find(@book.user_id)
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @users = User.all
      @user = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :image, :body, :user_id)
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    user = User.find(book.user_id)
    unless user.id == current_user.id
      redirect_to books_path
    end
  end
end
