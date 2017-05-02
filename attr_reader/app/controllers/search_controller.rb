class SearchController < ApplicationController

    def request_trade
    #Making the book trade request, whatever that meanzs
    # Send a message to the user or whatever?

    book = Book.find(params[:id])
    user = User.find(book.user_id)
    UserMailer.book_trade(book, book.user.email).deliver_now

    redirect_to "/"
    end

end
