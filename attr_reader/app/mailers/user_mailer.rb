class UserMailer < ApplicationMailer
  # default from: "randomjessicaokay@gmail.com"

  def book_trade(book = {}, user)
    @greeting = "Greetings!"
    @url = '#'
    # @current_user = User.find(current_user.id)
    puts "Attempting to send mail to #{book.user.email}"
    @recipient0 = book.user.firstname
    @recipient1 = book.user.lastname
    @recipient2 = book.user.building_num
    @recipient3 = book.user.street
    @recipient4 = book.user.apt_num
    @recipient5 = book.user.city
    @recipient6 = book.user.state
    @recipient7 = book.user.zip_code
    mail(to: book.user.email, subject: "Request to trade: #{book.title}")
  end

  def welcome_send(user)
    @greeting = "Greetings!"
    @url = "/users/edit"
    @recipient = user
    mail to: user.email, subject: "Welcome! Thanks for signing up for attr_reader!"
  end

  def spam(book = {}, user)
    @greeting = "Greetings!"
    @url = '#'
    @help = user
    puts "email for shipment confirmation"
    mail to: user, subject: " #{book.title} is headed your way!"
  end

end
