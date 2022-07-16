class User::SearchesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if params[:title].present? && params[:author].present?
      @searches = RakutenWebService::Books::Book.search(title: params[:title],author: params[:author])
    elsif params[:title].present?
      @searches = RakutenWebService::Books::Book.search(title: params[:title])
    elsif params[:author].present?
      @searches = RakutenWebService::Books::Book.search(author: params[:author])
    end
    @book = Book.new
  end

end

