class SearchsController < ApplicationController

  def index
    if params[:keyword]
      @searchs = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end

  def show
    @search = RakutenWebService::Books::Book.search(isbn: params[:isbn])
    unless Book.exists?(isbn: params[:isbn])
      book = Book.new
      @search.each do |search|
        book.title = @search.title
        book.author =  @search.author
        book.isbn = @search.isbn
        book.sales_date = @search.sales_date
        book.image = @search.large_image_url
        book.rakuten_url = @search.item_url
      end
      book.save
    end
  end

end
