class BooksController < ApplicationController
#  before_action :require_user

  def index
    if user_signed_in?
      @user = current_user.id
      @books = Book.where(["user_id = ? and status = ?", params[:user_id], "Shelfed"])
    # elsif params[:id] == "sign_up"
    #   redirect_to "/users/sign_up"
    elsif request.path == "/sign_up" || request.path == "/signup"
      redirect_to "/users/sign_up"
    else
      redirect_to "/users/sign_in"
    end
  end

  def show
    if user_signed_in?
      userid = params[:user_id]
      @books_array = Book.where(user_id: params[:user_id]).length
      @userid = params[:user_id]
      @user = current_user.id.to_s
      if @user.to_s == params[:user_id]
        @books = Book.where(["user_id = ? and status = ?", params[:user_id], "Shelfed"])
        @message = "My Bookshelf Info"
      else
        @books = Book.where(["user_id = ? and status = ?", params[:user_id], "Shelfed"])
        @user = User.find_by(id: params[:user_id])
        @message = "#{@user[:username]}'s Books!"
      end
    elsif request.path == "/sign_up" || request.path == "/signup"
      redirect_to "/users/sign_up"
    else
      redirect_to "/users/sign_in"
    end
  end

  def new
    if user_signed_in?
    @user_id = params[:user_id]
    @book_details = []
    elsif request.path == "/sign_up" || request.path == "/signup"
      redirect_to "/users/sign_up"
    else
      redirect_to "/users/sign_in"
    end
  end

  def profile
    if user_signed_in?
    @user = User.find(current_user.id)
    elsif request.path == "/sign_up" || request.path == "/signup"
      redirect_to "/users/sign_up"
    else
      redirect_to "/users/sign_in"
    end
  end

  def party
    if user_signed_in?
    @search_type = params[:search_type]
    @search_input = params[:search_input].split(" ").join("+")
    response = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=#{@search_input}+#{@search_type}", format: :plain)
    body = JSON.parse(response)
    @book_details = book_details(body)
    render "new"
    elsif request.path == "/sign_up" || request.path == "/signup"
      redirect_to "/users/sign_up"
    else
      redirect_to "/users/sign_in"
    end
  end

  def create
    if(current_user.street != "" && current_user.city != "")
      puts "#{current_user.street} #{current_user.city} foobar foobar"
    Book.create(title: params[:title],
      author: params[:authors],
      isbn: params[:isbn],
      description: params[:description],
      genre: params[:genre],
      user_id: current_user.id,
      status: "Shelfed")
    redirect_to("/#{current_user.id}")
    else
    flash[:notice] = "#{current_user.street} #{current_user.city}Please add your address in your my profile settings before adding a book to your shelf"
       redirect_to("/#{current_user.id}/add_a_book")
    end
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to("/#{current_user.id}")
  end

  def shelf_it
    @user = User.find(current_user.id)
    book = Book.find(params[:id])
    book.update_attribute(:status, "Shelfed")
    redirect_to "/current_user.id/book_list"
  end

  def recieved
    @user = User.find(current_user.id)
    book = Book.find(params[:id])
    book.update_attribute(:status, "In Use")
    redirect_to "/current_user.id/book_list"
  end

  def welcome_send
    @current_user = User.find(current_user.id)
    UserMailer.welcome_send(@current_user).deliver_now
  end

  def search
    if user_signed_in?
    @search = Book.search(params[:q])
    @search_result = @search.result.includes(:user).where.not(user_id: current_user.id)
    render "search"
    elsif request.path == "/sign_up" || request.path == "/signup"
      redirect_to "/users/sign_up"
    else
      redirect_to "/users/sign_in"
    end
  end

  def book_details(body)
    (body["items"]).map do |book|

        title = book["volumeInfo"]["title"]
        isbn = book["volumeInfo"]["industryIdentifiers"]
        description = book["volumeInfo"]["description"]
        authors = book["volumeInfo"]["authors"]
        genre = book["volumeInfo"]["categories"]
        {
          title: title ? title : "",
          isbn: isbn ? isbn[0]["identifier"] : "",
          description: description ? description : "",
          authors: authors ? authors.join(", ") : "",
          genre: genre ? genre[0]: ""
          }

      end
  end



end
