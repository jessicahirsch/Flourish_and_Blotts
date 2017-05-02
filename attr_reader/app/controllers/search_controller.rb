class SearchController < ApplicationController

  def request_trade
    @current_user = User.find(current_user.id)
    @og = params[:user_id]
    book = Book.find(params[:id])
    user = User.find(book.user_id)
    UserMailer.book_trade(book, book.user.email).deliver_now
    book.update_attribute(:status, "Requested")
    Relation.create(og: @og,
      requester: @current_user,
      book_id: book.id,
      book_places: @current_user.email)
    redirect_to "/"
  end

  def shipment_confirmation
    @user = User.find(current_user.id)
    book = Book.find(params[:id])
    @help = Relation.all[2].book_places
    UserMailer.spam(book, @help).deliver_now
    book.update_attributes(:status => "En Route", :user_id => @new_user)
    redirect_to "/"
  end

end
