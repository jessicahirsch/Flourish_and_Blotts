class UserMailer < ApplicationMailer
  # default from: "randomjessicaokay@gmail.com"

  def book_trade(book = {}, user)
    @greeting = "Greetings!"
    @url = '#'
    puts "Attempting to send mail to #{book.user.email}"
    @recipient = user
    mail(to: book.user.email, subject: "Request to trade: #{book.title}")
  end

  def welcome_send(user)
    @greeting = "Greetings!"
    @url = "/users/edit"
    @recipient = user
    mail to: user.email, subject: "Welcome! Thanks for signing up for attr_reader!"
  end

end
