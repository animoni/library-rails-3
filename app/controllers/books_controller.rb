class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
  # binding.pry
    @book = Book.find_by(id: params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render new_book_path
    end
  end

  def edit
    #binding.pry
    @book = Book.find_by(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to books_path
    else
      render edit
    end
  end

  def destroy
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :description, author_id: :nil)
  end
end
