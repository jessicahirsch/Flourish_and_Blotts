class UsersController < ApplicationController
def show

    render "/devise/registrations/new"
end

def create
    user = User.create(username: params['user']['username'],
      email: params['user']['email'],
      password: params['user']['password']
    )
    # byebug
    redirect_to ("/login")

  end

end
