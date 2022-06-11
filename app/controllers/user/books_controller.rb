class User::BooksController < ApplicationController

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to search_path(isbn: book.isbn)
    end
  end

  def index
    @books = Book.all
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :isbn, :sales_date, :image, :rakuten_url)
  end

end
