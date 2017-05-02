module BooksHelper

  def addy
    current_user.street  current_user.apt_num, current_user.zip_code, current_user.city, current_user.state
  end

  def book_background
    num = rand(1..46)
    p num
    book_image = "book#{num}.png"
  end

end
