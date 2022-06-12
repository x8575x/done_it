class User::ReadingsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    reading = Reading.new(book_id: @book.id)
    reading.user_id = current_user.id
    reading.save
    redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:book_id])
    reading = current_user.readings.find_by(book_id: @book.id)
    reading.destroy
    redirect_to request.referer
  end

  def index
  end

end
