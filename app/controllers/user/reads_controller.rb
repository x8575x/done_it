class User::ReadsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    read = Read.new(book_id: @book.id)
    read.user_id = current_user.id
    read.save
    redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:book_id])
    read = current_user.reads.find_by(book_id: @book.id)
    read.destroy
    redirect_to request.referer
  end

  def index
  end

end
