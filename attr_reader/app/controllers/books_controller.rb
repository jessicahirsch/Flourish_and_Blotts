class BooksController < ApplicationController
  
#  before_filter :set_search

  def index
    @books = Book.where(user_id: params[:user_id])
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.where(user_id: params[:user_id])
  end

  def new
    @user_id = params[:user_id]
    response = HTTParty.get(`https://www.googleapis.com/books/v1/volumes?q=#{search_input}+#{search_type}`)
    body = JSON.parse(response)

  end

  def create
    Book.create(title: @title,
      author: @authors,
      isbn: @isbn,
      description: @description)
    redirect_to('/:user_id/book_list')
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to('/:user_id')
  end

  def request_trade
    #Making the book trade request, whatever that meanzs
    # Send a message to the user or whatever?
    book = Book.find(params[:id])
    UserMailer.book_trade(book).deliver_now
    redirect_to "/books"
  end
  
  def search
    @q=Book.search(params[:q])
    @resu = @q.result.includes(:user)
    render "search"
  end

  def book_details(body)
    (body.items).map do |book|
      {
        title: body.items[book].volumeInfo.title,
        isbn: body.items[book].volumeInfo.industryIdentifiers[1].identifier,
        description: body.items[book].searchInfo.textSnippet,
        authors: body.items[0].volumeInfo.authors.join(", ")
        }

    end
  end
  
  private
 
end
