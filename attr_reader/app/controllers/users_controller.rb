class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
#  def index
#    @search = Book.search(params[:q])
#    @books = @search.result
#  end
  
  def index
    
  end
    
end
