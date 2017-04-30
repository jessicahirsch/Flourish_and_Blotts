class BooksController < ApplicationController
#  before_action :require_user

  def index
    if user_signed_in?
      @user = current_user.id
      @books = Book.where(user_id: params[:user_id])
    else
      redirect_to "/login"
    end
  end

  def show
    if user_signed_in?
      userid = params[:user_id]
      @user = current_user.id
      @books = Book.where(user_id: params[:user_id])
      if @user.to_s == params[:user_id]
        @message = "This is the logged in user"
      else
        @message = "Oh no"
      end
    else
      redirect_to "/login"
    end
  end

  def new
    @user_id = params[:user_id]
    @book_details = []
  end

  def party
    @search_type = params[:search_type]
    @search_input = params[:search_input].split(" ").join("+")
    response = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=#{@search_input}+#{@search_type}", format: :plain)
    body = JSON.parse(response)
    @book_details = book_details(body)
    render "new"
  end

  def create
    Book.create(title: params[:title],
      author: params[:authors],
      isbn: params[:isbn],
      description: params[:description],
      user_id: current_user.id)
    redirect_to("/:user_id")
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
    # using ransack
    @search = Book.search(params[:q])
    @search_result = @search.result.includes(:user).where.not(user_id: current_user.id)
    render "search"
  end

  def book_details(body)
    (body["items"]).map do |book|
      pp body
      if book["volumeInfo"]["industryIdentifiers"]
        title = book["volumeInfo"]["title"]
        isbn = book["volumeInfo"]["industryIdentifiers"][0]["identifier"]
        genre = book["volumeInfo"]["categories"][0]
        description = book["volumeInfo"]["description"]
        authors = book["volumeInfo"]["authors"]
        {
          title: title ? title : "",
          isbn: isbn ? isbn : "",
          description: description ? description : "",
          authors: authors ? authors.join(", ") : "",
          genre: genre ? genre : ""
          }
      else
        title = book["volumeInfo"]["title"]
        description = book["volumeInfo"]["description"]
        authors = book["volumeInfo"]["authors"]
        genre = book["volumeInfo"]["categories"][0]
        {
          title: title ? title : "",
          isbn: "",
          description: description ? description : "",
          authors: authors ? authors.join(", ") : "",
          genre: genre ? genre : ""
          }
      end
    end
  end


end
