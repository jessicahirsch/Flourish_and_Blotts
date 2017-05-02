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

  # def shipment_confirmation(book = {}, user)
  #   @greeting = "Greetings!"
  #   @url = '#'
  #   puts "email for shipment confirmation"
  #   mail(to: user.email, subject: "More Knowledge is headed your way!")
end
