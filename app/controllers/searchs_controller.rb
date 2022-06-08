class SearchsController < ApplicationController

  def index
    if params[:keyword]
      @books = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end

  def show
    @book = RakutenWebService::Books::Book.search(isbn: params[:isbn])
  end

end
