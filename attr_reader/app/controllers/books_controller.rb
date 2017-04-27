class BooksController < ApplicationController
  
  def index
    @books = Book.find_by(user_id: params[:user_id])
  end
  
  def show
    @books = Book.find_by(user_id: params[:user_id])
  end
  
  def new
#    @isbn = params[:isbn]
#    response = HTTParty.get("http://mtastat.us/api/trains/#{train_line}")
#    @body = JSON.parse(response)
#    @train_name = @body["name"]
#    @long_status = @body["long_status"]
  end
  
  def create

#    Book.create(title: params[:title],
#      author: params[:author],
#      isbn: params[:isbn],
#      description: params[:description])
#    redirect_to('/rocks')
  end 
  
  def destroy
    Book.destroy(params[:id])
    redirect_to('/:user_id')
  end
  
end
