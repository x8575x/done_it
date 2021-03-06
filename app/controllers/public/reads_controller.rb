class Public::ReadsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    read = Read.new(book_id: @book.id)
    read.user_id = current_user.id
    read.save

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
    # ログイン中のユーザーが積読本に登録していた場合、削除
    if @book.get_by?(current_user)
      get = current_user.gets.find_by(book_id: @book.id)
      get.destroy
    end

    # 感想投稿画面へ
    redirect_to new_review_path(isbn: @book.id)
  end

  def destroy
    read = Read.find(params[:id])
    read.destroy
    redirect_to user_read_path(current_user)
  end

  def index
    @user = User.find(params[:user_id])
    @reads = Read.where(user_id: params[:user_id]).order(created_at: :desc).page(params[:page]).per(15)
  end

end
