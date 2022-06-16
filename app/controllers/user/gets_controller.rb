class User::GetsController < ApplicationController
  layout 'user/application'


  def create
    @book = Book.find(params[:book_id])
    get = Get.new(book_id: @book.id)
    get.user_id = current_user.id
    get.save

    # ログイン中のユーザーが読みたい本に登録していた場合、削除
    if @book.want_by?(current_user)
      want = current_user.wants.find_by(book_id: @book.id)
      want.destroy
    end
    # ログイン中のユーザーが読んでる本に登録していた場合、削除
    if @book.reading_by?(current_user)
      reading = current_user.readings.find_by(book_id: @book.id)
      reading.destroy
    end
    # ログイン中のユーザーが読んだ本に登録していた場合、削除
    if @book.read_by?(current_user)
      read = current_user.reads.find_by(book_id: @book.id)
      read.destroy
    end

    render 'user/books/btn'
  end

  def destroy
    @book = Book.find(params[:book_id])
    get = current_user.gets.find_by(book_id: @book.id)
    get.destroy
    render 'user/books/btn'
  end

  def index
    @user = User.find(params[:user_id])
    @gets = Get.where(user_id: params[:user_id])
  end

end
