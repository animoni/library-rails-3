class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:success] = "New book added to list."
    else
      flash[:danger] = "Something is not quite right."
      render new_book_path
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])
    if @book.update_attributes(book_params)
      redirect_to books_path
      flash[:notice] = "The edit was success."
    else
      flash[:notice] = "The edit was not really successful."
      render edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to books_path
    flash[:danger] = "OH WHY?!"
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :description)
  end
end
