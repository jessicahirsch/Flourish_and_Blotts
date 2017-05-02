module BooksHelper

def addy
  current_user.street  current_user.apt_num, current_user.zip_code, current_user.city, current_user.state
end

end
