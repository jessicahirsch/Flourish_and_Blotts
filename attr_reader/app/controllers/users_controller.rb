class UsersController < ApplicationController


#  def index
#    @search = Book.search(params[:q])
#    @books = @search.result
#  end

  # DELETE /resource
  def destroy
    sign_out current_user
    redirect_to ("/login")
  end


  def show
    render "/devise/registrations/new"
  end

# def created

# end

  def edit
    render :edit
    render "/devise/registrations/edit"
  end

  def update
    render "/devise/registrations/edit"
  end

  def create
    user = User.create(username: params['user']['username'],
      email: params['user']['email'],
      password: params['user']['password']
    )
    # byebug
    redirect_to edit_user_registration_path

  end

end
