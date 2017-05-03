class UserMailer < ApplicationMailer


  def book_trade(book = {}, user)
    @greeting = "Greetings!"
    @url = '#'
    puts "Attempting to send mail to #{book.user.email}"
    @recipient = user
    mail(to: book.user.email, subject: "Request to trade: #{book.title}")
  end

  def spam(book = {}, user)
    @greeting = "Greetings!"
    @url = '#'
    @help = user
    puts "email for shipment confirmation"
    mail(to: user, subject: "More Knowledge is headed your way!")
  end

end
