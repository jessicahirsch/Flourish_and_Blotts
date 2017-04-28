class BooksController < ApplicationController
#  before_filter :set_search
before_action :require_user
  def index
    if !user_signed_in?
      redirect_to "/"
    else
    @books = Book.where(user_id: params[:user_id])
  end
  end

  def show
    @books = Book.where(user_id: params[:user_id])
  end

  def new
    @user_id = params[:user_id]
    @book_details = []
  end

  def party
    @search_input = params[:search_input].split(" ").join("+")
    @search_type = params[:search_type]
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

  def search
    @q=Book.search(params[:q])
    @resu = @q.result.includes(:user)
    render "search"
  end

def book_details(body)

(body["items"]).map do |book|
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


    end
end

  private




end
