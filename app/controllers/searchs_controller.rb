class SearchsController < ApplicationController

  def index
    if params[:keyword]
      @searchs = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
    @book = Book.new
  end

end

