class UserMailer < ApplicationMailer
  default from: "randomjessicaokay@gmail.com"

  def welcome_email()
    # @user = users.email
    # @email  = email
    @book = @book
    # @book = @book.title
    @greeting = "Greetings!"
    @url  = '#'
    puts "Attempting to send mail!"

    mail(to: @user, subject: 'Welcome to attr_reader!')
  end

  # def welcome_send()
  #   @user = user
  #   mail to: user.email, subject: "Welcome!"
  # end

end
