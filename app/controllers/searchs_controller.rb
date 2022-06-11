class SearchsController < ApplicationController

  def index
    if params[:keyword]
      @searchs = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
    @book = Book.new

  end

  def show
    @search = RakutenWebService::Books::Book.search(isbn: params[:isbn])
    @reviews = Review.where(book_id: params[:isbn])
  end

end

