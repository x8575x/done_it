class User::SearchsController < ApplicationController

  def index
    if params[:title].present? && params[:author].present?
      @searchs = RakutenWebService::Books::Book.search(title: params[:title],author: params[:author])
    elsif params[:title].present?
      @searchs = RakutenWebService::Books::Book.search(title: params[:title])
    elsif params[:author].present?
      @searchs = RakutenWebService::Books::Book.search(author: params[:author])
    end
    @book = Book.new
  end

end

