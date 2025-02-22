class BooksController < ApplicationController
  
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  #10
  def new
    @book = Book.new
  end 
  
  #投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    
    
    if @book.save
      flash[:notice]="You have created book successfully"
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all.includes(:user)
      render :index
    end
 
  end 
  
  def index
    @book = Book.new
    @user = current_user
    # すべての本を取得
    @books = Book.all
  end 
  
  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    
    @book_comment = BookComment.new
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update 
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end 
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    
    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to '/books'
    end
  end 
  
  
  #投稿データのストロングパラメータ
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end 

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
  
end
