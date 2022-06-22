class User::ReadingsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    reading = Reading.new(book_id: @book.id)
    reading.user_id = current_user.id
    reading.save

    # ログイン中のユーザーが読みたい本に登録していた場合、削除
    if @book.want_by?(current_user)
      want = current_user.wants.find_by(book_id: @book.id)
      want.destroy
    end
    # ログイン中のユーザーが積読本に登録していた場合、削除
    if @book.get_by?(current_user)
      get = current_user.gets.find_by(book_id: @book.id)
      get.destroy
    end

    render 'user/books/btn'
  end

  def destroy
    @book = Book.find(params[:book_id])
    reading = current_user.readings.find_by(book_id: @book.id)
    reading.destroy
    render 'user/books/btn'
  end

  def index
    @user = User.find(params[:user_id])
    @readings = Reading.where(user_id: params[:user_id]).order(created_at: :desc).page(params[:page]).per(15)
  end

end
