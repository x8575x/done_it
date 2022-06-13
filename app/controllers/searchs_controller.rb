class SearchsController < ApplicationController

  def index
    if params[:title]
      @searchs = RakutenWebService::Books::Book.search(title: params[:title])
    end
    if params[:author]
      @searchs = RakutenWebService::Books::Book.search(author: params[:author])
    end
    @book = Book.new
  end

end

