class UserMailer < ApplicationMailer
  default from: "randomjessicaokay@gmail.com"

  def book_trade()
    # @users = users.email
    # @email  = email
    @book = @book
    # @book = @book.title
    @greeting = "Greetings!"
    @url  = '#'
    puts "Attempting to send mail!"

    mail(to: @user, subject: 'Request to Trade at attr_reader!')
  end

  def welcome_send()
    @user = users
    mail to: users.email, subject: "Welcome!"
  end

end
