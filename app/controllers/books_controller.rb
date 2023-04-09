class BooksController < ApplicationController

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
    @book.save
    redirect_to book_path(book.id)
  end

  def edit

  end

  private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end

end
