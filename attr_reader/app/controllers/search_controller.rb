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
      book_places: "")
    redirect_to "/"
end

end
