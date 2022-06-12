class User::GetsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    get = Get.new(book_id: @book.id)
    get.user_id = current_user.id
    get.save
    redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:book_id])
    get = current_user.gets.find_by(book_id: @book.id)
    get.destroy
    redirect_to request.referer
  end

  def index
  end

end
