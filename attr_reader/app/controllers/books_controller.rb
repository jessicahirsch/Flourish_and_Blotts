class BooksController < ApplicationController

  #  before_action :require_user

  def index
    if !user_signed_in?
      redirect_to "/"
    else
      @books = Book.where(user_id: params[:user_id])
    end
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.where(user_id: params[:user_id])
  end

  def new
    @user_id = params[:user_id]
    @book_details = []
  end

  def party
    if params[:search_type] == "Title"
      @search_type = "inTitle"
    elsif params[:search_type] == "Author"
      @search_type = "inAuthor"
    else
      @search_type = "inIsbn"
    end

    @search_input = params[:search_input].split(" ").join("+")
    response = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=#{@search_input}+#{@search_type}", format: :plain)
    body = JSON.parse(response)
    @book_details = book_details(body)
    redirect_to("/:user_id")
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
    @q=Book.search(params[:q])
    @resu = @q.result.includes(:user)
    render "search"
  end

  def book_details(body)
    pp body
    (body["items"]).map do |book|
      if book["volumeInfo"]["industryIdentifiers"]

        title = book["volumeInfo"]["title"]
        isbn = book["volumeInfo"]["industryIdentifiers"][0]["identifier"]
        description = book["volumeInfo"]["description"]
        authors = book["volumeInfo"]["authors"]
        {
          title: title ? title : "",
          isbn: isbn ? isbn : "",
          description: description ? description : "",
          authors: authors ? authors.join(", ") : ""
          }
      else
        title = book["volumeInfo"]["title"]
        description = book["volumeInfo"]["description"]
        authors = book["volumeInfo"]["authors"]
        {
          title: title ? title : "",
          isbn: "",
          description: description ? description : "",
          authors: authors ? authors.join(", ") : ""
          }
      end
    end
  end


end
