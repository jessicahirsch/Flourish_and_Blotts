module HomeHelper

def resource_name
  current_user
end

def resource
  @resource ||= User.new
end

def devise_mapping
  @devise_mapping ||= Devise.mappings[current_user]
end

end
