class Public::RanksController < ApplicationController

  def rank
    # 読みたい本ランキング
    if (params[:sort]) == 'want'
      @books = Book.find(Want.group(:book_id).order('count(book_id) desc').pluck(:book_id)).first(14)
    # 読んでいる本ランキング
    elsif (params[:sort]) == 'reading'
      @books = Book.find(Reading.group(:book_id).order('count(book_id) desc').pluck(:book_id)).first(14)
    # 読んだ本ランキング
    elsif (params[:sort]) == 'read'
      @books = Book.find(Read.group(:book_id).order('count(book_id) desc').pluck(:book_id)).first(14)
    # 積読本ランキング
    elsif (params[:sort]) == 'get'
      @books = Book.find(Get.group(:book_id).order('count(book_id) desc').pluck(:book_id)).first(14)
    else
      @books = Book.find(Review.group(:book_id).order('count(book_id) desc').pluck(:book_id)).first(14)
    end
  end

end
