# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def book_trade
    # book = Book.first
    UserMailer.book_trade()
  end

  def welcome_send
    UserMailer.welcome_send()
  end

end
