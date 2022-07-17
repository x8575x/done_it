class Public::BooksController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
    @reviews = Review.where(book_id: params[:id]).order(created_at: :desc).page(params[:page]).per(15)
  end


  def my_review
    @book = Book.find(params[:book_id])
    @my_review = Review.where(book_id: @book.id).where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(10)
  end



  private
  def book_params
    params.require(:book).permit(:title, :author, :isbn, :sales_date, :image, :image_m, :rakuten_url, :publisher_name, :item_caption, :item_price)
  end

end
