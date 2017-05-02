module BooksHelper

  def book_background
    num = rand(1..46)
    p num
    book_image = "book#{num}.png"
  end
end
