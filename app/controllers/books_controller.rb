class BooksController < ApplicationController

  def top
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
     @books = Book.all
     @book = Book.new(book_params)
     @book.save
    #  redirect_to book_path(book.id)

     if @book.save
       flash[:notice] = "Book was successfully created."
       redirect_to book_path(@book.id)
     else 
       render :index
     end

  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])

    if book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(book.id)
    else 
      redirect_to book_path(book.id)
    end
  end

  def destroy
    book = Book.find(params[:id])


    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to index_path
    end
  end





private

def book_params
    params.require(:book).permit(:title, :body)
end


end
