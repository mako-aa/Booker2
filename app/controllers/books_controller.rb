class BooksController < ApplicationController
  #10
  def new
    @book = Book.new
    @user = current_user
  end 
  
  #投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end 
  
  def index
    @book = Book.new
    @user = current_user
    # すべての本を取得し、ユーザー情報も含める
    @books = Book.all.includes(:user)
  end 
  
  def show
    @book = Book.find(params[:id])
    @user = current_user
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end 
  
  
  #投稿データのストロングパラメータ
  private
  
  def book_params
    params.require(:book).permit(:title, :opinion)
  end 
  
end
