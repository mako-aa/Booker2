class BooksController < ApplicationController
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
      redirect_to books_path
    else
      @user = current_user
      @books = Book.all.includes(:user)
      render :index
    end
 
  end 
  
  def index
    @book = Book.new
    @user = current_user
    # すべての本を取得し、ユーザー情報も含める
    @books = Book.all.includes(:user)
  end 
  
  def show
    @book = Book.new
    @book2 = Book.find(params[:id])
    @user = @book2.user
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
    params.require(:book).permit(:title, :opinion)
  end 
  
end
