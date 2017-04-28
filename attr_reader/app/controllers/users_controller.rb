class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
#  def index
#    @search = Book.search(params[:q])
#    @books = @search.result
#  end

  def index
  end

  # def create
  #   email_add = params['user']['email']
  #   UserMailer.welcome_email(email_add).deliver_now
  #   redirect_to(:back)
  # end

end
