class User::WantsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    want = Want.new(book_id: @book.id)
    want.user_id = current_user.id
    want.save
    redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:book_id])
    want = current_user.wants.find_by(book_id: @book.id)
    want.destroy
    redirect_to request.referer
  end

  def index
  end

end
