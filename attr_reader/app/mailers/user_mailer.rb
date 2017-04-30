class UserMailer < ApplicationMailer
  # default from: "randomjessicaokay@gmail.com"

  def book_trade(book = {})
    @greeting = "Greetings!"
    @url  = '#'
    puts "Attempting to send mail to #{book.user.email}"

    mail(to: book.user.email, subject: "Request to trade: #{book.title}")
  end

  def welcome_send
    @user = users
    mail to: users.email, subject: "Welcome!"
  end

end
