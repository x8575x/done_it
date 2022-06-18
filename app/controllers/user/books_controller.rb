class User::BooksController < ApplicationController
  layout 'user/application'

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
    @reviews = Review.where(book_id: params[:id]).page(params[:page]).per(10)
  end



  private
  def book_params
    params.require(:book).permit(:title, :author, :isbn, :sales_date, :image, :image_m, :rakuten_url,
      :publisher_name, :item_caption, :item_price)
  end

end
