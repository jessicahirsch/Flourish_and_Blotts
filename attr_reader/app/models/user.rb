class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :books,  dependent: :destroy 


  # after_create :welcome_send
  # def welcome_send
  #   UserMailer.welcome_send().deliver
  # end

end
