class UserMailer < ApplicationMailer


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

  def spam(book = {}, user)
    @greeting = "Greetings!"
    @url = '#'
    @help = user
    puts "email for shipment confirmation"
    mail to: user, subject: " #{book.title} is headed your way!"
  end

end
