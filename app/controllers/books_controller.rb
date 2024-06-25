class BooksController < ApplicationController
  def new
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to book_path(@book.id)
    else
      flash[:alert] = "投稿に失敗しました。"
      redirect_to books_path
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end