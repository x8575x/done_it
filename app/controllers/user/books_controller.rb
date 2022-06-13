class User::BooksController < ApplicationController
  layout 'user/application'

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to book_path(book.id)
    end
  end

  def show
    @book = Book.find(params[:id])
    @reviews = Review.where(book_id: params[:id])
  end

  def index
    @books = Book.all
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :isbn, :sales_date, :image, :image_m, :rakuten_url,
      :publisher_name, :item_caption, :item_price)
  end

end
