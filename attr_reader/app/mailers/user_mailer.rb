class UserMailer < ApplicationMailer
  # default from: "randomjessicaokay@gmail.com"

  def book_trade(book = {})
    @greeting = "Greetings!"
    @url  = '#'
    @edit_profile_url = '#'
    puts "Attempting to send mail to #{book.user.email}"

    mail(to: book.user.email, subject: "Request to trade: #{book.title}")
  end

  # def welcome_send
  #   @user = user
  #   mail(to: user.email, subject: "Welcome!")
  # end

end
